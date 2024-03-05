import 'package:ready_structure/core/di/locator.dart';
import 'package:ready_structure/core/services/navigation.dart';
import 'package:ready_structure/core/shared_prefs/app_shared_prefs.dart';
import 'package:ready_structure/core/ui/cubit/app_cubit.dart';
import 'package:ready_structure/core/ui/snackbar_and_toast/snackbar.dart';
import 'package:ready_structure/core/ui/state/cubit_state.dart';
import 'package:ready_structure/features/auth/data/model/user_model.dart';
import 'package:ready_structure/features/auth/domain/usecases/auth_usecases.dart';
import 'package:ready_structure/features/auth/presentation/screen/login_screen.dart';
import 'package:ready_structure/features/products/presentation/screen/products_screen.dart';

class AuthCubit extends AppCubit {
  AuthCubit({required this.useCase}) : super(InitResource());
  final AuthUseCase useCase;

  Future<void> register({required UserModel user}) async {
    emit(LoadingResource());
    final result = await useCase.register(user);
    if (result.hasDataOnly) {
      emit(SuccessResource());
      locator<AppSharedPrefs>().setRememberMe(true);
      AppSnackBar.showSuccessSnackBar();
      locator<NavigationService>().pushAndRemoveUntil(const ProductsScreen());
    } else {
      emit(ErrorResource());
      AppSnackBar.showErrorSnackBar(message: result.error!.message);
    }
  }

  Future<void> login({required UserModel user}) async {
    emit(LoadingResource());
    final result = await useCase.login(user);
    if (result.hasDataOnly) {
      emit(SuccessResource());
      locator<AppSharedPrefs>().setRememberMe(true);
      AppSnackBar.showSuccessSnackBar();
      locator<NavigationService>().pushAndRemoveUntil(const ProductsScreen());
    } else {
      emit(ErrorResource());
      AppSnackBar.showErrorSnackBar(message: result.error!.message);
    }
  }

  void logOut() {
    locator<AppSharedPrefs>().setRememberMe(false);
    locator<NavigationService>().pushAndRemoveUntil(const LoginScreen());
  }
}
