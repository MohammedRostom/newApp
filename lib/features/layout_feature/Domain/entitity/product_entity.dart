class ProductEntity {
  final int _id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rate;
  final int count;

  ProductEntity({
    required int id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    required this.rate,
    required this.count,
  }) : _id = id;

  int get id => _id; //لما يجيلك هات القيمة بتعته من ال ال برافيت
}
