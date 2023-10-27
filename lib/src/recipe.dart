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
}
