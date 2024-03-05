import 'package:ready_structure/core/networking/models/api/void_result/void_model.dart';
import 'package:ready_structure/core/networking/results/result.dart';
import 'package:ready_structure/features/auth/data/model/user_model.dart';

abstract class AuthRDS {
  Future<Result<VoidApiResponse>> login(UserModel user);

  Future<Result<VoidApiResponse>> register(UserModel user);
}
