class Product {
  final int id;
  final String name;
  final String permalink;
  final String price;
  final String regularPrice;
  final bool featured;
  final List<String> images;
  final String storeName;
  final String averageRating;

  Product({
    required this.id,
    required this.name,
    required this.permalink,
    required this.price,
    required this.regularPrice,
    required this.featured,
    required this.images,
    required this.storeName,
    required this.averageRating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      permalink: json['permalink'],
      price: json['price'],
      regularPrice: json['regular_price'],
      featured: json['featured'],
      images: (json['images'] as List).map((image) => image['src'] as String).toList(),
      storeName: json['store']['name'],
      averageRating: json['average_rating'],
    );
  }
}
