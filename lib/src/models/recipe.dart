import 'package:recipe_scraper/recipe_scraper.dart';
import 'package:recipe_scraper/src/models/restricted_diet.dart';

class Recipe {
  final DateTime scrapedAt;

  final String url;
  final List<String> keywords;
  final List<RestrictedDiet>? restrictedDiets;
  final String title;
  final String description;
  final List<String> imageUrls;
  final num? rating;
  final List<Ingredient> ingredients;
  final List<String> instructions;
  final num? calories;
  final num? carbohydrates;
  final num? protein;
  final num? fat;
  final num? saturatedFat;
  final num? unsaturatedFat;
  final num? sugar;
  final num? cholesterol;
  final num? sodium;
  final num? fiber;
  final int servings;
  final String? servingsType;
  final String? prepTime;
  final String? cookTime;
  final String? totalTime;

  Recipe({
    required this.scrapedAt,
    required this.url,
    required this.keywords,
    required this.restrictedDiets,
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.rating,
    required this.ingredients,
    required this.instructions,
    required this.calories,
    required this.carbohydrates,
    required this.protein,
    required this.fat,
    required this.saturatedFat,
    required this.unsaturatedFat,
    required this.sugar,
    required this.cholesterol,
    required this.sodium,
    required this.fiber,
    required this.servings,
    required this.servingsType,
    required this.prepTime,
    required this.cookTime,
    required this.totalTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'scrapedAt': scrapedAt,
      'url': url,
      'keywords': keywords,
      'restrictedDiets': restrictedDiets?.map((diet) => diet.name).toList(),
      'title': title,
      'description': description,
      'imageUrls': imageUrls,
      'rating': rating,
      'ingredients':
          ingredients.map((ingredient) => ingredient.toJson()).toList(),
      'instructions': instructions,
      'calories': calories,
      'carbohydrates': carbohydrates,
      'protein': protein,
      'fat': fat,
      'saturatedFat': saturatedFat,
      'unsaturatedFat': unsaturatedFat,
      'sugar': sugar,
      'cholesterol': cholesterol,
      'sodium': sodium,
      'fiber': fiber,
      'servings': servings,
      'servingsType': servingsType,
      'prepTime': prepTime,
      'cookTime': cookTime,
      'totalTime': totalTime,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> data) {
    return Recipe(
      scrapedAt: data['scrapedAt'],
      url: data['url'],
      keywords: List<String>.from(data['keywords']),
      restrictedDiets: data['restrictedDiets'] == null
          ? null
          : List<RestrictedDiet>.from(
              data['restrictedDiets'].map(
                (diet) => RestrictedDiet.values
                    .firstWhere((element) => element.name == diet),
              ),
            ),
      title: data['title'],
      description: data['description'],
      imageUrls: List<String>.from(data['imageUrls']),
      rating: data['rating'],
      ingredients: List<Ingredient>.from(data['ingredients']
          .map((ingredient) => Ingredient.fromJson(ingredient))),
      instructions: List<String>.from(data['instructions']),
      calories: data['calories'],
      carbohydrates: data['carbohydrates'],
      protein: data['protein'],
      fat: data['fat'],
      saturatedFat: data['saturatedFat'],
      unsaturatedFat: data['unsaturatedFat'],
      sugar: data['sugar'],
      cholesterol: data['cholesterol'],
      sodium: data['sodium'],
      fiber: data['fiber'],
      servings: data['servings'],
      servingsType: data['servingsType'],
      prepTime: data['prepTime'],
      cookTime: data['cookTime'],
      totalTime: data['totalTime'],
    );
  }

  dynamic toJson() {
    return {
      'scrapedAt': scrapedAt,
      'url': url,
      'keywords': keywords,
      'restrictedDiets': restrictedDiets?.map((diet) => diet.name).toList(),
      'title': title,
      'description': description,
      'imageUrls': imageUrls,
      'rating': rating,
      'ingredients':
          ingredients.map((ingredient) => ingredient.toJson()).toList(),
      'instructions': instructions,
      'calories': calories,
      'carbohydrates': carbohydrates,
      'protein': protein,
      'fat': fat,
      'saturatedFat': saturatedFat,
      'unsaturatedFat': unsaturatedFat,
      'sugar': sugar,
      'cholesterol': cholesterol,
      'sodium': sodium,
      'fiber': fiber,
      'servings': servings,
      'servingsType': servingsType,
      'prepTime': prepTime,
      'cookTime': cookTime,
      'totalTime': totalTime,
    };
  }
}
