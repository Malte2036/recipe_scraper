import 'package:recipe_scraper/recipe_scraper.dart';

const List<String> _units = [
  'tsp',
  'tbsp',
  'oz',
  'cup',
  'pint',
  'quart',
  'gal',
  'gallon',
  'lb',
  'kg',
  'g',
  "cl",
  "dl",
  'ml',
  'l',
  "EL",
  "TL",
];

// ignore: prefer_interpolation_to_compose_strings
final String _unitsPattern = r'(?:' + _units.join('|') + ')';

// TODO: improve this function to match more ingredient strings
Ingredient calculateIngredient(String ingredientString) {
  ingredientString = _replaceFractions(ingredientString);

  List<String> ingredientParts = ingredientString.split(' ');

  // fix for "100g -> 100 g"
  for (String unit in _units) {
    if (ingredientParts[0].endsWith(unit)) {
      final amount = double.tryParse(ingredientParts[0].replaceFirst(unit, ""));
      if (amount != null) {
        ingredientParts[0] = amount.toString();
        ingredientParts.insert(1, unit);
        ingredientString = ingredientParts.join(" ");
        break;
      }
    }
  }

  // remove all non-numeric characters from the amount string
  final amount = double.tryParse(
    RegExp(r'\d+(\.\d*)?').stringMatch(ingredientParts.first) ?? "",
  );

  // extract the unit name using a named capture group
  final unit = RegExp(r'\b(?<=\s)(?<unit>' + _unitsPattern + r')(?![^$ _])\b')
      .stringMatch(ingredientString);

  final name = ingredientParts
      .sublist(amount != null ? 1 : 0)
      .join(' ')
      .replaceFirst(unit ?? "", '')
      .trim();

  return Ingredient(
    name: name,
    quantity: amount ?? 1,
    unit: unit,
  );
}

String _replaceFractions(String ingredientString) {
  final fractions = {
    '½': '0.5',
    '¼': '0.25',
    '¾': '0.75',
    '⅓': '0.33',
    '⅔': '0.66',
  };

  for (final fraction in fractions.keys) {
    ingredientString =
        ingredientString.replaceAll(fraction, fractions[fraction]!);
  }

  return ingredientString;
}
