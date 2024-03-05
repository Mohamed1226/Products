import 'package:ready_structure/core/di/locator.dart';
import 'package:ready_structure/core/shared_prefs/app_shared_prefs.dart';
import 'package:ready_structure/core/ui/cubit/app_cubit.dart';
import 'package:ready_structure/core/ui/snackbar_and_toast/snackbar.dart';
import 'package:ready_structure/core/ui/state/cubit_state.dart';
import 'package:ready_structure/features/auth/data/model/user_model.dart';

class UserCubit extends AppCubit {
  UserCubit() : super(InitResource());

  saveUserLocal(UserModel user) {
    emit(LoadingResource());

    locator<AppSharedPrefs>().setUserModel(user);

    emit(SuccessResource());
    AppSnackBar.showSuccessSnackBar();
  }
}
