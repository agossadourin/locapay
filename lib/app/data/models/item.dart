class Item {
  final String id;
  final String name;
  final String imageURL;
  final String description;
  final double rating;
  final int price;

  Item({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.description,
    required this.rating,
    required this.price,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as String,
      name: json['name'] as String,
      imageURL: json['imageURL'] as String,
      description: json['description'] as String,
      rating: json['rating'] as double,
      price: json['price'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageURL': imageURL,
      'description': description,
      'rating': rating,
      'price': price,
    };
  }
}
