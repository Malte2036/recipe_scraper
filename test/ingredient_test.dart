import 'package:recipe_scraper/src/ingredient_utils.dart';
import 'package:test/test.dart';

void main() {
  group('Ingredient', () {
    test('Valid ingredient string with quantity, unit, and name', () {
      final ingredientString = "5 g Sugar";
      final ingredient = calculateIngredient(ingredientString);

      expect(ingredient, isNotNull);
      expect(ingredient.name, "Sugar");
      expect(ingredient.quantity, 5);
      expect(ingredient.unit, "g");
    });

    // write test for 100g -> 100 g
    test('Valid ingredient string with quantity and unit', () {
      final ingredientString = "100g Sugar";
      final ingredient = calculateIngredient(ingredientString);

      expect(ingredient, isNotNull);
      expect(ingredient.name, "Sugar");
      expect(ingredient.quantity, 100);
      expect(ingredient.unit, "g");
    });

    test('Valid ingredient string with quantity and name', () {
      final ingredientString = "5 Eggs";
      final ingredient = calculateIngredient(ingredientString);

      expect(ingredient, isNotNull);
      expect(ingredient.name, "Eggs");
      expect(ingredient.quantity, 5);
      expect(ingredient.unit, isNull);
    });
  });
}
