class LapHomeModel {
  final String id;
  final String description;
  final String name;
  final String category;
  final num price;
  final String status;
  final String image;

  LapHomeModel(
      {required this.id,
      required this.description,
      required this.name,
      required this.category,
      required this.price,
      required this.status,
      required this.image});

  factory LapHomeModel.fromJson(Map<String, dynamic> json) {
    return LapHomeModel(
      id: json['_id'],
      description: json['description'],
      name: json['name'],
      category: json['category'],
      price: json['price'],
      status: json['status'],
      image: json['image'],
    );
  }
}
