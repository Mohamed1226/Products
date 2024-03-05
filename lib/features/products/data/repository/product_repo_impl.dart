import 'package:ready_structure/core/networking/results/result.dart';
import 'package:ready_structure/features/products/data/data_source/product_rds_impl.dart';
import 'package:ready_structure/features/products/data/model/product_model.dart';
import 'package:ready_structure/features/products/domain/repository/product_repository.dart';

class ProductRepoImpl extends ProductRepository {
  final ProductRDSImpl rdsImpl;

  ProductRepoImpl({required this.rdsImpl}) : super(rdsImpl);

  @override
  Future<Result<Product>> getProductByID(String id) {
    return rdsImpl.getProductByID(id);
  }

  @override
  Future<Result<Products>> getProducts() {
    return rdsImpl.getProducts();
  }
}
