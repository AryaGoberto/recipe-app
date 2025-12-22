class Recipe {
  final String title;
  final String? author;
  final String time;
  final String image;
  final String? calories;

  Recipe({
    required this.title,
    this.author,
    required this.time,
    required this.image,
    this.calories,
  });
}
