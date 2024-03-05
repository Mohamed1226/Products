import 'package:ready_structure/core/ui/cubit/app_cubit.dart';
import 'package:ready_structure/core/ui/state/cubit_state.dart';
import 'package:ready_structure/features/auth/data/model/user_model.dart';

class AuthCubit extends AppCubit {
  AuthCubit() : super(InitResource());

  Future<void> register({required UserModel userModel}) async {

  }
}
