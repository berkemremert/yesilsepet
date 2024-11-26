class RecipePreferences {
  bool isVegan;
  bool isVegetarian;
  bool isHalal;
  bool isLowCalorie;
  bool isHighProtein;
  bool isLowCarb;
  bool isQuickRecipe;
  bool isEasyRecipe;
  bool isGourmetMeal;

  RecipePreferences({
    this.isVegan = false,
    this.isVegetarian = false,
    this.isHalal = false,
    this.isLowCalorie = false,
    this.isHighProtein = false,
    this.isLowCarb = false,
    this.isQuickRecipe = false,
    this.isEasyRecipe = false,
    this.isGourmetMeal = false,
  });
}