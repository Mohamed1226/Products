import 'package:ready_structure/core/networking/models/api/data/base_api_model.dart';
import 'package:ready_structure/features/products/data/model/rate_model.dart';

class Products extends BaseApiDataModel {
  final List<Product> products;

  Products({required this.products});

  factory Products.fromJson(Map<String, dynamic> json) {
    var list = json['items'] as List;
    List<Product> productsList = list.map((i) => Product.fromJson(i)).toList();
    return Products(products: productsList);
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class Product extends BaseApiDataModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final String image;
  final double price;

  final RateModel rate;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.price,
    required this.rate,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        rate: RateModel.fromJson(json["rating"]),
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        image: json["image"],
        price: json["price"] is int ? json["price"].toDouble() : json["price"]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
