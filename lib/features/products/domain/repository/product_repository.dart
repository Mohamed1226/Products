import 'package:ready_structure/core/networking/results/result.dart';
import 'package:ready_structure/features/products/data/data_source/products_rds.dart';
import 'package:ready_structure/features/products/data/model/product_model.dart';

abstract class ProductRepository {
  final ProductRDS rds;

  ProductRepository( this.rds);

  Future<Result<Products>> getProducts();

  Future<Result<Product>> getProductByID(String id);
}
