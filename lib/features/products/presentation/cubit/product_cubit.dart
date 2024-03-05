import 'package:ready_structure/core/ui/cubit/app_cubit.dart';
import 'package:ready_structure/core/ui/snackbar_and_toast/snackbar.dart';
import 'package:ready_structure/core/ui/state/cubit_state.dart';
import 'package:ready_structure/features/products/data/model/product_model.dart';
import 'package:ready_structure/features/products/domain/usecases/product_usecases.dart';

class ProductCubit extends AppCubit {
  ProductCubit({required this.useCase}) : super(InitResource());
  final ProductUseCase useCase;

  List<Product> products = [];
  List<Product> favouriteProducts = [];

  void addToFavouriteList(Product product) {
    product.isFavourite = true;
    favouriteProducts.add(product);
    syncProductStatue(product, true);
    emit(RefreshResource());
  }

  void removeFromFavouriteList(Product product) {
    product.isFavourite = false;
    favouriteProducts.removeWhere((element) => element.id == product.id);
    syncProductStatue(product, false);
    emit(RefreshResource());
  }

  void syncProductStatue(Product model, bool newStatus) {
    final product = products.firstWhere((element) => element.id == model.id);
    product.isFavourite = newStatus;
  }

  Future<void> getProducts() async {
    emit(LoadingResource());
    final result = await useCase.getProducts();
    if (result.hasDataOnly) {
      emit(SuccessResource());
      products = result.data!.products;
    } else {
      emit(ErrorResource());
      AppSnackBar.showErrorSnackBar(message: result.error!.message);
    }
  }
}
