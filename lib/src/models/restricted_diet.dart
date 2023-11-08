// see: https://schema.org/RestrictedDiet
enum RestrictedDiet {
  diabeticDiet,
  glutenFreeDiet,
  halalDiet,
  hinduDiet,
  kosherDiet,
  lowCalorieDiet,
  lowFatDiet,
  lowLactoseDiet,
  lowSaltDiet,
  veganDiet,
  vegetarianDiet
}

RestrictedDiet? restrictedDietFromUrl(String dietUrl) {
  switch (dietUrl) {
    case "https://schema.org/DiabeticDiet":
      return RestrictedDiet.diabeticDiet;
    case "https://schema.org/GlutenFreeDiet":
      return RestrictedDiet.glutenFreeDiet;
    case "https://schema.org/HalalDiet":
      return RestrictedDiet.halalDiet;
    case "https://schema.org/HinduDiet":
      return RestrictedDiet.hinduDiet;
    case "https://schema.org/KosherDiet":
      return RestrictedDiet.kosherDiet;
    case "https://schema.org/LowCalorieDiet":
      return RestrictedDiet.lowCalorieDiet;

    case "https://schema.org/LowFatDiet":
      return RestrictedDiet.lowFatDiet;
    case "https://schema.org/LowLactoseDiet":
      return RestrictedDiet.lowLactoseDiet;
    case "https://schema.org/LowSaltDiet":
      return RestrictedDiet.lowSaltDiet;
    case "https://schema.org/VeganDiet":
      return RestrictedDiet.veganDiet;
    case "https://schema.org/VegetarianDiet":
      return RestrictedDiet.vegetarianDiet;

    default:
      print("unknown diet: $dietUrl");
      return null;
  }
}
