import 'package:ready_structure/core/ui/cubit/app_cubit.dart';
import 'package:ready_structure/core/ui/snackbar_and_toast/snackbar.dart';
import 'package:ready_structure/core/ui/state/cubit_state.dart';
import 'package:ready_structure/features/products/data/model/product_model.dart';
import 'package:ready_structure/features/products/domain/usecases/product_usecases.dart';

class ProductCubit extends AppCubit {
  ProductCubit({required this.useCase}) : super(InitResource());
  final ProductUseCase useCase;

  List<Product> products = [];

  Future<void> getProducts() async {
    final result = await useCase.getProducts();
    if (result.hasDataOnly) {
      products = result.data!.products;
    } else {
      AppSnackBar.showErrorSnackBar();
    }
  }
}
