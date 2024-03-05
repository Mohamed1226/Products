import 'package:ready_structure/core/networking/results/result.dart';
import 'package:ready_structure/features/products/data/model/product_model.dart';
import 'package:ready_structure/features/products/domain/repository/product_repository.dart';

class ProductUseCase {
  late ProductRepository _repository;

  ProductUseCase({required ProductRepository repository}) {
    _repository = repository;
  }

  Future<Result<Product>> getProductByID(String id) {
    return _repository.getProductByID(id);
  }

  Future<Result<Products>> getProducts() {
    return _repository.getProducts();
  }
}
