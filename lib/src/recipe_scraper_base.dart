import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html_parser;
import 'package:recipe_scraper/recipe_scraper.dart';
import 'package:recipe_scraper/src/models/recipe.dart';

Future<Recipe?> scrapeRecipe(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final document = html_parser.parse(response.body);

    // Find the script tag with type application/ld+json
    final scriptTags =
        document.querySelectorAll('script[type="application/ld+json"]');

    for (final scriptTag in scriptTags) {
      final scriptData = scriptTag.text;
      final jsonData = json.decode(scriptData);

      final decodedRecipe = decodeRecipeData(jsonData, url);
      if (decodedRecipe != null) {
        return decodedRecipe;
      }
    }

    // If no recipe is found in the JSON-LD data, try to scrape using other methods here
  } else {
    throw Exception('Failed to load recipe page');
  }

  // If recipe data is not found in JSON-LD or other methods, return null
  return null;
}

Recipe? decodeRecipeData(dynamic jsonData, String url) {
  if (jsonData != null) {
    if (jsonData is List<dynamic>) {
      for (final item in jsonData) {
        if (item["@type"] == "Recipe") {
          jsonData = item;
          break;
        }
      }
    }

    if (jsonData["@graph"] is List<dynamic>) {
      // Handle the case where JSON-LD data is an array
      final List<dynamic> graphData = jsonData["@graph"];
      for (final graphItem in graphData) {
        if (graphItem["@type"] == "Recipe") {
          return _parseRecipeData(graphItem, url);
        }
      }
    } else if (jsonData is Map<String, dynamic>) {
      // Handle the case where JSON-LD data is a single object
      if (jsonData["@type"] == "Recipe") {
        return _parseRecipeData(jsonData, url);
      }
    }
  }
  return null;
}

Recipe _parseRecipeData(dynamic jsonData, String url) {
  final List<String> keywords = _getRecipeKeywords(jsonData['keywords'] ?? []);

  final String title = jsonData['name'];
  final String description = jsonData['description'];
  final List<String> imageUrls = _getRecipeImageUrls(jsonData['image'] ?? []);

  final double? rating = _getRecipeRating(jsonData['aggregateRating']);

  final List<Ingredient> ingredients =
      _getRecipeIngredients(jsonData['recipeIngredient'] ?? []);

  final List<String> instructions =
      _getRecipeInstructions(jsonData['recipeInstructions'] ?? []);

  final Map<String, dynamic>? nutrition = jsonData['nutrition'];
  final double? calories =
      _getRecipeCalories(nutrition != null ? nutrition["calories"] : null);
  final double? carbohydrates = _getRecipeNutritionValue(
      nutrition != null ? nutrition["carbohydrateContent"] : null);
  final double? protein = _getRecipeNutritionValue(
      nutrition != null ? nutrition["proteinContent"] : null);
  final double? fat = _getRecipeNutritionValue(
      nutrition != null ? nutrition["fatContent"] : null);
  final double? saturatedFat = _getRecipeNutritionValue(
      nutrition != null ? nutrition["saturatedFatContent"] : null);
  final double? unsaturatedFat = _getRecipeNutritionValue(
      nutrition != null ? nutrition["unsaturatedFatContent"] : null);
  final double? sugar = _getRecipeNutritionValue(
      nutrition != null ? nutrition["sugarContent"] : null);
  final double? cholesterol = _getRecipeNutritionValue(
      nutrition != null ? nutrition["cholesterolContent"] : null);
  final double? sodium = _getRecipeNutritionValue(
      nutrition != null ? nutrition["sodiumContent"] : null);
  final double? fiber = _getRecipeNutritionValue(
      nutrition != null ? nutrition["fiberContent"] : null);

  final (int, String?) servingsTupel =
      _getRecipeServings(jsonData['recipeYield']);

  final String? prepTime = jsonData['prepTime'];
  final String? cookTime = jsonData['cookTime'];
  final String? totalTime = jsonData['totalTime'];

  final recipe = Recipe(
    scrapedAt: DateTime.now(),
    url: url,
    keywords: keywords,
    title: title,
    description: description,
    imageUrls: imageUrls,
    rating: rating,
    ingredients: ingredients,
    instructions: instructions,
    calories: calories,
    carbohydrates: carbohydrates,
    protein: protein,
    fat: fat,
    saturatedFat: saturatedFat,
    unsaturatedFat: unsaturatedFat,
    sugar: sugar,
    cholesterol: cholesterol,
    sodium: sodium,
    fiber: fiber,
    servings: servingsTupel.$1,
    servingsType: servingsTupel.$2,
    prepTime: prepTime,
    cookTime: cookTime,
    totalTime: totalTime,
  );

  return recipe;
}

List<String> _getRecipeKeywords(dynamic data) {
  if (data == null) {
    return [];
  }

  if (data is String) {
    return data.split(',');
  }

  if (data is! List<dynamic>) {
    throw Exception('Recipe keywords is of invalid type: ${data.runtimeType}');
  }

  List<dynamic> listData = data;
  if (listData.isEmpty) {
    return [];
  }

  return List<String>.from(listData);
}

List<String> _getRecipeImageUrls(dynamic data) {
  if (data is String) {
    return [data];
  }

  if (data is! List<dynamic>) {
    if (data["url"] != null) {
      return [data["url"]];
    }

    throw Exception('Recipe image is of invalid type: ${data.runtimeType}');
  }

  List<dynamic> listData = data;
  if (listData.isEmpty) {
    return [];
  }

  if (listData.first is String) {
    return List<String>.from(listData);
  }

  return listData.map((e) => e['url'].toString()).toList();
}

double? _getRecipeRating(dynamic data) {
  if (data == null) {
    return null;
  }

  if (data is double) {
    return data;
  }

  if (data is! Map<String, dynamic>) {
    throw Exception('Recipe rating is of invalid type: ${data.runtimeType}');
  }

  final Map<String, dynamic> mapData = data;
  if (mapData.isEmpty) {
    return null;
  }

  return double.tryParse(mapData['ratingValue'].toString());
}

List<Ingredient> _getRecipeIngredients(dynamic data) {
  if (data is String) {
    return [Ingredient.fromIngredientString(data)];
  }

  if (data is! List<dynamic>) {
    throw Exception(
        'Recipe ingredients is of invalid type: ${data.runtimeType}');
  }

  List<dynamic> listData = data;
  if (listData.isEmpty) {
    return [];
  }

  if (listData.first is String) {
    return List<String>.from(listData)
        .map((e) => Ingredient.fromIngredientString(e))
        .toList();
  }

  return listData
      .map((e) => Ingredient.fromIngredientString(e["text"]))
      .toList();
}

List<String> _getRecipeInstructions(dynamic data) {
  if (data is String) {
    return [data];
  }

  if (data is! List<dynamic>) {
    throw Exception(
        'Recipe instructions is of non-list type: ${data.runtimeType}');
  }

  List<dynamic> listData = data;
  if (listData.isEmpty) {
    return [];
  }

  final firstItem = listData.first;

  if (firstItem is String) {
    return List<String>.from(listData);
  }

  if (firstItem["text"] != null) {
    return listData
        .where((e) => e['text'] != null)
        .map((e) => e["text"].toString())
        .toList();
  }

  if (firstItem["itemListElement"] != null) {
    final List<dynamic> itemListElements =
        listData.map((e) => e["itemListElement"]).toList();

    return itemListElements
        .map((itemListElement) {
          final List<dynamic> itemListElementList =
              itemListElement.map((e) => e["text"]).toList();

          return itemListElementList;
        })
        .toList()
        .fold([], (previousValue, element) => [...previousValue, ...element]);
  }

  throw Exception(
      'Recipe instructions is of invalid type: ${data.runtimeType}');
}

double? _getRecipeCalories(dynamic data) {
  if (data == null) {
    return null;
  }

  if (data is double) {
    return data;
  }

  if (data is String) {
    return double.tryParse(data.split(" ").first);
  }

  if (data is! List<dynamic>) {
    throw Exception('Recipe calories is of invalid type: ${data.runtimeType}');
  }

  List<dynamic> listData = data;
  if (listData.isEmpty) {
    return null;
  }

  if (listData.first is String) {
    return double.tryParse(listData.first);
  }

  return double.tryParse(listData.first['value'].toString());
}

double? _getRecipeNutritionValue(dynamic data) {
  if (data == null) {
    return null;
  }

  if (data is double) {
    return data;
  }

  if (data is int) {
    return data.toDouble();
  }

  if (data is String) {
    return double.tryParse(data.split(" ").first);
  }

  throw Exception(
      'Recipe nutrition value is of invalid type: ${data.runtimeType}: $data');
}

(int, String?) _getRecipeServings(dynamic data) {
  if (data is String) {
    return _servingsStringToServingsTupel(data);
  }

  if (data is int) {
    return (data, null);
  }

  if (data is! List<dynamic>) {
    throw Exception('Servings is of invalid type: ${data.runtimeType}');
  }

  List<dynamic> listData = data;
  if (listData.isEmpty) {
    throw Exception('Servings is empty');
  }

  final firstItem = listData.first;
  if (firstItem! is String && firstItem! is int && firstItem['text'] != null) {
    return _servingsStringToServingsTupel(firstItem['text']);
  }

  return _servingsStringToServingsTupel(listData
      .map((e) => e.toString())
      .firstWhere(
          (String element) =>
              element.contains(" ") && element.split(" ")[1] != "servings",
          orElse: () => firstItem));
}

(int, String?) _servingsStringToServingsTupel(String servingsString) {
  final splitString = servingsString.split(" ");

  if (int.tryParse(splitString[0]) == null) {
    return (int.parse(splitString[1]), splitString[0]);
  }

  return (
    int.parse(splitString[0]),
    splitString.length > 1
        ? splitString.sublist(1, splitString.length).join(" ")
        : null
  );
}
