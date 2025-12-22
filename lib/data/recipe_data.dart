import '../models/recipe.dart';

class RecipeData {
  static final List<Map<String, String>> featuredRecipes = [
    {
      'title': 'Asian white noodle with extra seafood',
      'author': 'James Spader',
      'time': '20 Min',
      'image': 'assets/images/asianwhitenoodle.jpg',
    },
    {
      'title': 'Healthy green bowl with fresh veggies',
      'author': 'Olivia Marks',
      'time': '15 Min',
      'image': 'assets/images/healthygreenbowl.jpg',
    },
  ];

  static final List<String> categories = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Vegan',
  ];

  static final List<Map<String, String>> popularRecipes = [
    {
      'title': 'Healthy Taco Salad with fresh vegetable',
      'time': '20 Min',
      'calories': '120 Kcal',
      'image': 'assets/images/healthytacos.jpg',
    },
    {
      'title': 'Japanese-style Pancakes Recipe',
      'time': '16 Min',
      'calories': '128 Kcal',
      'image': 'assets/images/japanesestylepancakes.jpg',
    },
    {
      'title': 'Creamy salmon poke bowl',
      'time': '25 Min',
      'calories': '215 Kcal',
      'image': 'assets/images/creamysalmon.jpg',
    },
  ];
}
