import 'package:ready_structure/core/data/firebase/firebase_provider.dart';
import 'package:ready_structure/core/networking/models/api/void_result/void_model.dart';
import 'package:ready_structure/core/networking/results/result.dart';
import 'package:ready_structure/features/auth/data/data_source/auth_rds.dart';
import 'package:ready_structure/features/auth/data/model/user_model.dart';

class AuthRDSImpl extends FirebaseRDS implements AuthRDS {
  @override
  Future<Result<VoidApiResponse>> login(UserModel user) {
    return logInUser(user);
  }

  @override
  Future<Result<VoidApiResponse>> register(UserModel user) {
    return createUser(user);
  }
}
