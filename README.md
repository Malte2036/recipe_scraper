# Recipe Scraper

A Flutter/Dart package that allows you to scrape recipe data from websites using JSON-LD structured data. This package extracts comprehensive recipe information including ingredients, instructions, nutrition facts, and more from recipe websites that implement schema.org Recipe markup.

## Features

- 🔍 **Automatic Recipe Detection**: Scrapes recipes from any website using JSON-LD structured data
- 🍳 **Comprehensive Data Extraction**: Extracts all recipe details including:
  - Title, description, and images
  - Ingredients with automatic parsing (quantity, unit, name)
  - Step-by-step instructions
  - Nutrition information (calories, protein, carbs, fat, etc.)
  - Cooking times (prep, cook, total)
  - Servings and ratings
  - Keywords and dietary restrictions
- 🥗 **Diet Support**: Recognizes restricted diets (vegan, vegetarian, gluten-free, etc.)
- 📊 **Structured Data Models**: Type-safe models for Recipe, Ingredient, and RestrictedDiet
- 🌐 **Wide Compatibility**: Works with any website implementing schema.org Recipe markup

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  recipe_scraper: ^1.0.0
```

Then, run `flutter pub get` to install the package.

## Usage

### Basic Recipe Scraping

Import the `recipe_scraper` package and use the `scrapeRecipe()` function to extract recipe data from a URL:

```dart
import 'package:recipe_scraper/recipe_scraper.dart';

// Scrape a recipe from a URL
final recipe = await scrapeRecipe('https://example.com/recipe-page');

if (recipe != null) {
  print('Title: ${recipe.title}');
  print('Description: ${recipe.description}');
  print('Servings: ${recipe.servings}');
  print('Total Time: ${recipe.totalTime}');
} else {
  print('No recipe found at this URL');
}
```

### Accessing Recipe Details

```dart
final recipe = await scrapeRecipe('https://example.com/recipe-page');

if (recipe != null) {
  // Basic information
  print('Title: ${recipe.title}');
  print('Description: ${recipe.description}');
  print('Rating: ${recipe.rating}');
  print('Keywords: ${recipe.keywords.join(", ")}');

  // Images
  if (recipe.imageUrls.isNotEmpty) {
    print('Main image: ${recipe.imageUrls.first}');
  }

  // Servings and timing
  print('Servings: ${recipe.servings} ${recipe.servingsType ?? ""}');
  print('Prep time: ${recipe.prepTime}');
  print('Cook time: ${recipe.cookTime}');
  print('Total time: ${recipe.totalTime}');
}
```

### Working with Ingredients

The package automatically parses ingredient strings into structured data:

```dart
final recipe = await scrapeRecipe('https://example.com/recipe-page');

if (recipe != null) {
  for (final ingredient in recipe.ingredients) {
    print('${ingredient.quantity} ${ingredient.unit ?? ""} ${ingredient.name}');
    // Example output: "2 cups flour"
  }
}
```

### Accessing Instructions

```dart
final recipe = await scrapeRecipe('https://example.com/recipe-page');

if (recipe != null) {
  print('Instructions:');
  for (var i = 0; i < recipe.instructions.length; i++) {
    print('${i + 1}. ${recipe.instructions[i]}');
  }
}
```

### Nutrition Information

```dart
final recipe = await scrapeRecipe('https://example.com/recipe-page');

if (recipe != null) {
  print('Nutrition Facts:');
  if (recipe.calories != null) print('Calories: ${recipe.calories}');
  if (recipe.protein != null) print('Protein: ${recipe.protein}g');
  if (recipe.carbohydrates != null) print('Carbs: ${recipe.carbohydrates}g');
  if (recipe.fat != null) print('Fat: ${recipe.fat}g');
  if (recipe.saturatedFat != null) print('Saturated Fat: ${recipe.saturatedFat}g');
  if (recipe.sugar != null) print('Sugar: ${recipe.sugar}g');
  if (recipe.fiber != null) print('Fiber: ${recipe.fiber}g');
  if (recipe.sodium != null) print('Sodium: ${recipe.sodium}mg');
}
```

### Checking Dietary Restrictions

```dart
final recipe = await scrapeRecipe('https://example.com/recipe-page');

if (recipe != null && recipe.restrictedDiets != null) {
  for (final diet in recipe.restrictedDiets!) {
    print('Suitable for: ${diet.name}');
  }

  // Check for specific diet
  if (recipe.restrictedDiets!.contains(RestrictedDiet.veganDiet)) {
    print('This recipe is vegan!');
  }
}
```

### Serialization

The `Recipe` model supports JSON serialization:

```dart
final recipe = await scrapeRecipe('https://example.com/recipe-page');

if (recipe != null) {
  // Convert to JSON
  final json = recipe.toJson();

  // Convert to Map
  final map = recipe.toMap();

  // Recreate from Map
  final recipeFromMap = Recipe.fromMap(map);
}
```

## How It Works

The package works by:

1. Fetching the HTML content from the provided URL
2. Parsing the HTML to find `<script type="application/ld+json">` tags
3. Extracting JSON-LD structured data that follows the [schema.org Recipe](https://schema.org/Recipe) format
4. Parsing the structured data into type-safe Dart models

This approach works with most modern recipe websites that implement proper structured data markup, including popular sites like AllRecipes, Food Network, Bon Appétit, and many more.

## Requirements

- Dart SDK: `^3.1.3`
- No Flutter-specific dependencies (works with pure Dart projects too!)

## Supported Platforms

This package works on all Dart/Flutter platforms:

- ✅ **Android**: Works out of the box
- ✅ **iOS**: Works out of the box
- ✅ **Desktop** (Windows, macOS, Linux): Works out of the box
- ⚠️ **Web**: Works with limitations (see below)

### Web Platform Note

When using this package on the web platform, you will encounter **CORS (Cross-Origin Resource Sharing)** errors when trying to fetch recipes from external websites. This is a browser security feature that prevents web pages from making requests to different domains.

**Solution**: You need to use a proxy server to fetch the recipe data. You can:

1. Set up your own proxy server that forwards requests
2. Use a CORS proxy service (for development/testing only)
3. Fetch the recipe data from your backend server instead of directly from the client

Example with a proxy:

```dart
// Instead of directly fetching from the recipe URL:
final recipe = await scrapeRecipe('https://example.com/recipe');

// Use your proxy server:
final recipe = await scrapeRecipe('https://your-proxy.com/fetch?url=https://example.com/recipe');
```

## Limitations

- Only works with websites that implement JSON-LD structured data using schema.org Recipe markup
- Ingredient parsing may not be perfect for all formats
- Some websites may have incomplete structured data
- **Web Platform**: When running on web, you may encounter CORS (Cross-Origin Resource Sharing) errors. To resolve this, you'll need to use a proxy server to fetch the recipe data. This is a browser security limitation and cannot be bypassed directly from the client side.

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests on [GitHub](https://github.com/Malte2036/recipe_scraper).

## License

This project is licensed under the BSD-3-Clause License - see the LICENSE file for details.

## About

Created to make recipe scraping simple and reliable for Flutter/Dart applications. Perfect for building recipe apps, meal planners, or cooking assistants!
