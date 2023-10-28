class Recipe {
  final String url;
  final List<String> keywords;
  final String title;
  final String description;
  final List<String> imageUrls;
  final double? rating;
  final List<String> ingredients;
  final List<String> instructions;
  final double? calories;
  final double? carbohydrates;
  final double? protein;
  final double? fat;
  final double? saturatedFat;
  final double? unsaturatedFat;
  final double? sugar;
  final double? cholesterol;
  final double? sodium;
  final double? fiber;
  final int servings;
  final String? servingsType;
  final String? prepTime;
  final String? cookTime;
  final String? totalTime;

  Recipe(
      {required this.url,
      required this.keywords,
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
      required this.totalTime});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      url: json['url'],
      keywords: List<String>.from(json['keywords']),
      title: json['title'],
      description: json['description'],
      imageUrls: List<String>.from(json['imageUrls']),
      rating: json['rating'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
      calories: json['calories'],
      carbohydrates: json['carbohydrates'],
      protein: json['protein'],
      fat: json['fat'],
      saturatedFat: json['saturatedFat'],
      unsaturatedFat: json['unsaturatedFat'],
      sugar: json['sugar'],
      cholesterol: json['cholesterol'],
      sodium: json['sodium'],
      fiber: json['fiber'],
      servings: json['servings'],
      servingsType: json['servingsType'],
      prepTime: json['prepTime'],
      cookTime: json['cookTime'],
      totalTime: json['totalTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'keywords': keywords,
      'title': title,
      'description': description,
      'imageUrls': imageUrls,
      'rating': rating,
      'ingredients': ingredients,
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

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'keywords': keywords,
      'title': title,
      'description': description,
      'imageUrls': imageUrls,
      'rating': rating,
      'ingredients': ingredients,
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
      url: data['url'],
      keywords: List<String>.from(data['keywords']),
      title: data['title'],
      description: data['description'],
      imageUrls: List<String>.from(data['imageUrls']),
      rating: data['rating'],
      ingredients: List<String>.from(data['ingredients']),
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
}
