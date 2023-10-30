import 'package:recipe_scraper/src/ingredient_utils.dart';

class Ingredient {
  final String name;
  final num quantity;
  final String? unit;

  Ingredient({
    required this.name,
    required this.quantity,
    required this.unit,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      quantity: json['quantity'],
      unit: json['unit'],
    );
  }

  factory Ingredient.fromIngredientString(String ingredientString) {
    return calculateIngredient(ingredientString);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'unit': unit,
    };
  }
}
