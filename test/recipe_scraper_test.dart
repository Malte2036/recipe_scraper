import 'package:recipe_scraper/src/recipe_scraper_base.dart';
import 'package:test/test.dart';

import 'mock_recipes.dart';

void main() {
  group('RecipeScraper', () {
    test(
        'decodeRecipeData from partyCoffeeByGoogleMock should return a Recipe object',
        () {
      const recipeData = partyCoffeeByGoogleMock;
      final recipe = decodeRecipeData(recipeData, "");

      expect(recipe, isNotNull);

      expect(recipe!.title, "Party Coffee Cake");
      expect(recipe.description, startsWith('This coffee cake is awesome and'));

      expect(recipe.imageUrls.length, 3);

      expect(recipe.rating, 5);

      expect(recipe.ingredients.length, 7);
      expect(recipe.ingredients.first, isNotNull);

      expect(recipe.ingredients[0].quantity, 2);

      expect(recipe.instructions.length, 6);
      expect(recipe.instructions.first, isNotNull);

      expect(recipe.calories, 270);
      expect(recipe.carbohydrates, isNull);
      expect(recipe.protein, isNull);
      expect(recipe.fat, isNull);
      expect(recipe.saturatedFat, isNull);
      expect(recipe.unsaturatedFat, isNull);
      expect(recipe.sugar, isNull);
      expect(recipe.cholesterol, isNull);
      expect(recipe.sodium, isNull);
      expect(recipe.fiber, isNull);

      expect(recipe.servings, 10);
      expect(recipe.servingsType, isNull);

      expect(recipe.totalTime, "PT50M");
    });
  });

  test(
      'decodeRecipeData from vanillaCakeByHouseAndGardenMock should return a Recipe object',
      () {
    const recipeData = vanillaCakeByHouseAndGardenMock;
    final recipe = decodeRecipeData(recipeData, "");

    expect(recipe, isNotNull);

    expect(recipe!.title, "Vanilla cake recipe");
    expect(recipe.description, startsWith('This vanilla cake recipe is so'));

    expect(recipe.imageUrls.length, 3);

    expect(recipe.rating, isNull);

    expect(recipe.ingredients.length, 7);
    expect(recipe.ingredients.first, isNotNull);

    expect(recipe.instructions.length, 4);
    expect(recipe.instructions.first, isNotNull);

    expect(recipe.calories, isNull);
    expect(recipe.carbohydrates, isNull);
    expect(recipe.protein, isNull);
    expect(recipe.fat, isNull);
    expect(recipe.saturatedFat, isNull);
    expect(recipe.unsaturatedFat, isNull);
    expect(recipe.sugar, isNull);
    expect(recipe.cholesterol, isNull);
    expect(recipe.sodium, isNull);
    expect(recipe.fiber, isNull);

    expect(recipe.servings, 6);
    expect(recipe.servingsType, "Serves");

    expect(recipe.totalTime, isNull);
  });

  test(
      'decodeRecipeData from pancakeByEinfachBackenMockWithGraph should return a Recipe object',
      () {
    const recipeData = pancakeByEinfachBackenMockWithGraph;
    final recipe = decodeRecipeData(recipeData, "");

    expect(recipe, isNotNull);

    expect(recipe!.title, "American Pancakes – Fluffiges Originalrezept");
    expect(recipe.description, startsWith('Wir zeigen dir, wie du ganz'));

    expect(recipe.imageUrls.length, 1);

    expect(recipe.rating, closeTo(4.9, 0.1));

    expect(recipe.ingredients.length, 9);
    expect(recipe.ingredients.first, isNotNull);

    expect(recipe.instructions.length, 2);
    expect(recipe.instructions.first, isNotNull);

    expect(recipe.calories, isNull);
    expect(recipe.carbohydrates, isNull);
    expect(recipe.protein, isNull);
    expect(recipe.fat, isNull);
    expect(recipe.saturatedFat, isNull);
    expect(recipe.unsaturatedFat, isNull);
    expect(recipe.sugar, isNull);
    expect(recipe.cholesterol, isNull);
    expect(recipe.sodium, isNull);
    expect(recipe.fiber, isNull);

    expect(recipe.servings, 10);
    expect(recipe.servingsType, "Stücke");
    expect(recipe.totalTime, "PT10M");
  });

  test(
      'decodeRecipeData from gnochiByAnItalienInMyKitchenMock should return a Recipe object',
      () {
    const recipeData = gnochiByAnItalienInMyKitchenMock;
    final recipe = decodeRecipeData(recipeData, "");

    expect(recipe, isNotNull);

    expect(recipe!.title, "Homemade Potato Gnocchi");
    expect(recipe.description,
        startsWith('An easy Italian Pasta Dish recipe, Homemade'));

    expect(recipe.imageUrls.length, 4);

    expect(recipe.rating, 5);

    expect(recipe.ingredients.length, 12);
    expect(recipe.ingredients.first, isNotNull);

    expect(recipe.instructions.length, 4);
    expect(recipe.instructions.first, isNotNull);

    expect(recipe.calories, 290);
    expect(recipe.carbohydrates, 38);
    expect(recipe.protein, 7);
    expect(recipe.fat, 11);
    expect(recipe.saturatedFat, 1);
    expect(recipe.unsaturatedFat, isNull);
    expect(recipe.sugar, isNull);
    expect(recipe.cholesterol, 40);
    expect(recipe.sodium, 610);
    expect(recipe.fiber, 3);

    expect(recipe.servings, 4);
    expect(recipe.servingsType, isNull);

    expect(recipe.totalTime, "PT65M");
  });

  test(
      'decodeRecipeData from steakByThomasSixtMock should return a Recipe object',
      () {
    const recipeData = steakByThomasSixtMock;
    final recipe = decodeRecipeData(recipeData, "");

    expect(recipe, isNotNull);

    expect(recipe!.title, "Rib Eye Steak mit Bratkartoffeln Rezept");
    expect(recipe.description,
        startsWith('Einfache Anleitung für Steak perfekt braten und'));

    expect(recipe.imageUrls.length, 1);

    expect(recipe.rating, closeTo(4.9, 0.1));

    expect(recipe.ingredients.length, 17);
    expect(recipe.ingredients.first, isNotNull);

    expect(recipe.instructions.length, 6);
    expect(recipe.instructions.first, isNotNull);

    expect(recipe.calories, closeTo(663921, 1));
    expect(recipe.carbohydrates, closeTo(28.5, 1));
    expect(recipe.protein, closeTo(25.3, 1));
    expect(recipe.fat, closeTo(75080.5, 1));
    expect(recipe.saturatedFat, closeTo(7438.2, 1));
    expect(recipe.unsaturatedFat, isNull);
    expect(recipe.sugar, closeTo(1.7, 1));
    expect(recipe.cholesterol, closeTo(216.8, 1));
    expect(recipe.sodium, closeTo(780.9, 1));
    expect(recipe.fiber, closeTo(3.4, 1));

    expect(recipe.servings, 2);
    expect(recipe.servingsType, isNull);

    expect(recipe.totalTime, "PT20M");
  });

  test(
      'decodeRecipeData from steakByGuteKuecheMock should return a Recipe object',
      () {
    const recipeData = steakByGuteKuecheMock;
    final recipe = decodeRecipeData(recipeData, "");

    expect(recipe, isNotNull);

    expect(recipe!.title, "Das perfekte Steak");
    expect(recipe.description,
        startsWith('Das perfekte Steak schmeckt köstlich und'));

    expect(recipe.imageUrls.length, 1);

    expect(recipe.rating, closeTo(4.6, 0.1));

    expect(recipe.ingredients.length, 8);
    expect(recipe.ingredients.first, isNotNull);

    expect(recipe.instructions.length, 7);
    expect(recipe.instructions.first, isNotNull);

    expect(recipe.calories, isNull);
    expect(recipe.carbohydrates, isNull);
    expect(recipe.protein, isNull);
    expect(recipe.fat, isNull);
    expect(recipe.saturatedFat, isNull);
    expect(recipe.unsaturatedFat, isNull);
    expect(recipe.sugar, isNull);
    expect(recipe.cholesterol, isNull);
    expect(recipe.sodium, isNull);
    expect(recipe.fiber, isNull);

    expect(recipe.servings, 2);
    expect(recipe.servingsType, "Portionen");

    expect(recipe.totalTime, "PT45M");
  });

  test(
      'decodeRecipeData from ginBasilSmashBySelbstgemachtFoodBlogMock should return a Recipe object',
      () {
    const recipeData = ginBasilSmashBySelbstgemachtFoodBlogMock;
    final recipe = decodeRecipeData(recipeData, "");

    expect(recipe, isNotNull);

    expect(recipe!.title, "Gin Basil Smash");
    expect(
        recipe.description,
        startsWith(
            'Eine zartgrüne Optik, Eiswürfel, der aromatische Duft nach'));

    expect(recipe.imageUrls.length, 4);

    expect(recipe.rating, closeTo(4.9, 0.1));

    expect(recipe.ingredients.length, 8);
    expect(recipe.ingredients.first, isNotNull);

    expect(recipe.instructions.length, 5);
    expect(recipe.instructions.first, isNotNull);

    expect(recipe.calories, 223);
    expect(recipe.carbohydrates, 22);
    expect(recipe.protein, 0.3);
    expect(recipe.fat, 0.1);
    expect(recipe.saturatedFat, 0.01);
    expect(recipe.unsaturatedFat, 0.03);
    expect(recipe.sugar, 21);
    expect(recipe.cholesterol, isNull);
    expect(recipe.sodium, 18);
    expect(recipe.fiber, 0.2);

    expect(recipe.servings, 1);
    expect(recipe.servingsType, "Cocktail");

    expect(recipe.totalTime, "PT5M");
  });

  test(
      'decodeRecipeData from alkohlfreieCocktailsByGaumenfreundinMock should return a Recipe object',
      () {
    const recipeData = alkoholfreieCocktailsByGaumenfreundinMock;
    final recipe = decodeRecipeData(recipeData, "");

    expect(recipe, isNotNull);

    expect(recipe!.title, "Alkoholfreie Cocktails");
    expect(recipe.description,
        startsWith('Alkoholfreie Cocktails sind erfrischend und schnell'));

    expect(recipe.imageUrls.length, 4);

    expect(recipe.rating, closeTo(4.9, 0.1));

    expect(recipe.ingredients.length, 21);
    expect(recipe.ingredients.first, isNotNull);

    expect(recipe.instructions.length, 4);
    expect(recipe.instructions.first, isNotNull);

    expect(recipe.calories, isNull);
    expect(recipe.carbohydrates, isNull);
    expect(recipe.protein, isNull);
    expect(recipe.fat, isNull);
    expect(recipe.saturatedFat, isNull);
    expect(recipe.unsaturatedFat, isNull);
    expect(recipe.sugar, isNull);
    expect(recipe.cholesterol, isNull);
    expect(recipe.sodium, isNull);
    expect(recipe.fiber, isNull);

    expect(recipe.servings, 1);
    expect(recipe.servingsType, "Glas");

    expect(recipe.totalTime, "PT10M");
  });
}
