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

    // Test for "100g -> 100 g"
    test('Valid ingredient string with quantity and unit', () {
      final ingredientString = "100g Sugar";
      final ingredient = calculateIngredient(ingredientString);

      expect(ingredient, isNotNull);
      expect(ingredient.name, "Sugar");
      expect(ingredient.quantity, 100);
      expect(ingredient.unit, "g");
    });

    // Test for "33cl -> 33 cl"
    test('Valid ingredient string with quantity and unit (33cl)', () {
      final ingredientString = "33cl Water";
      final ingredient = calculateIngredient(ingredientString);

      expect(ingredient, isNotNull);
      expect(ingredient.name, "Water");
      expect(ingredient.quantity, 33);
      expect(ingredient.unit, "cl");
    });

    test('Valid ingredient string with quantity and name', () {
      final ingredientString = "5 Eggs";
      final ingredient = calculateIngredient(ingredientString);

      expect(ingredient, isNotNull);
      expect(ingredient.name, "Eggs");
      expect(ingredient.quantity, 5);
      expect(ingredient.unit, isNull);
    });

    test('Valid ingredient string with quantity and name (1 Rapsöl)', () {
      final ingredientString = "1 Rapsöl";
      final ingredient = calculateIngredient(ingredientString);

      expect(ingredient, isNotNull);
      expect(ingredient.name, "Rapsöl");
      expect(ingredient.quantity, 1);
      expect(ingredient.unit, isNull);
    });

    test('Valid ingredient string with quantity, unit, and name (5 EL Rapsöl)',
        () {
      final ingredientString = "5 EL Rapsöl";
      final ingredient = calculateIngredient(ingredientString);

      expect(ingredient, isNotNull);
      expect(ingredient.name, "Rapsöl");
      expect(ingredient.quantity, 5);
      expect(ingredient.unit, "EL");
    });
  });

  test('Valid ingredient string with name', () {
    final ingredientString = "Pepper";
    final ingredient = calculateIngredient(ingredientString);

    expect(ingredient, isNotNull);
    expect(ingredient.name, "Pepper");
    expect(ingredient.quantity, 1);
    expect(ingredient.unit, isNull);
  });

  test('Valid ingredient string with quantity and name (1 Egg)', () {
    final ingredientString = "1 Egg";
    final ingredient = calculateIngredient(ingredientString);

    expect(ingredient, isNotNull);
    expect(ingredient.name, "Egg");
    expect(ingredient.quantity, 1);
    expect(ingredient.unit, isNull);
  });
}
