import 'package:ready_structure/core/networking/results/result.dart';
import 'package:ready_structure/features/products/data/model/product_model.dart';

abstract class ProductRDS {
  Future<Result<Products>> getProducts();

  Future<Result<Product>> getProductByID(String id);
}
