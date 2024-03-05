import 'package:ready_structure/core/helpers/enum/http_method_enum.dart';
import 'package:ready_structure/core/networking/data_source/remote/base_remote_ds.dart';
import 'package:ready_structure/core/networking/net/dio/dio_provider.dart';
import 'package:ready_structure/core/networking/results/result.dart';
import 'package:ready_structure/features/products/data/data_source/products_rds.dart';
import 'package:ready_structure/features/products/data/model/product_model.dart';

class ProductRDSImpl extends RemoteDataSource implements ProductRDS {
  ProductRDSImpl({required this.dioProvider}) : super(dioProvider);

  final DioProvider dioProvider;

  @override
  Future<Result<Product>> getProductByID(String id) {
    return apiRequest<Product>(
        converter: (
          json,
        ) =>
            Product.fromJson(json),
        method: HttpMethodEnum.GET,
        url: "products/$id");
  }

  @override
  Future<Result<Products>> getProducts() {
    return apiRequest<Products>(
        converter: (
          json,
        ) =>
            Products.fromJson(json),
        method: HttpMethodEnum.GET,
        url: "products");
  }
}
