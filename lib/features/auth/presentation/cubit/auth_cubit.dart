import 'package:ready_structure/core/ui/cubit/app_cubit.dart';
import 'package:ready_structure/core/ui/snackbar_and_toast/snackbar.dart';
import 'package:ready_structure/core/ui/state/cubit_state.dart';
import 'package:ready_structure/features/auth/data/model/user_model.dart';
import 'package:ready_structure/features/auth/domain/usecases/auth_usecases.dart';

class AuthCubit extends AppCubit {
  AuthCubit({required this.useCase}) : super(InitResource());
  final AuthUseCase useCase;

  Future<void> register({required UserModel user}) async {
    final result = await useCase.register(user);
    if (result.hasDataOnly) {
      AppSnackBar.showSuccessSnackBar();
    } else {
      AppSnackBar.showErrorSnackBar();
    }
  }

  Future<void> login({required UserModel user}) async {
    final result = await useCase.login(user);
    if (result.hasDataOnly) {
      AppSnackBar.showSuccessSnackBar();
    } else {
      AppSnackBar.showErrorSnackBar();
    }
  }
}
