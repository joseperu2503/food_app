class Dish {
  final String name;
  final double price;
  final String image;
  final double ranking;
  final Category category;

  Dish({
    required this.name,
    required this.price,
    required this.image,
    required this.ranking,
    required this.category,
  });
}

enum Category { mostPopular, salad, pasta }
