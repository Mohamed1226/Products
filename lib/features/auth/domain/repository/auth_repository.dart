import 'package:ready_structure/core/networking/models/api/void_result/void_model.dart';
import 'package:ready_structure/core/networking/results/result.dart';
import 'package:ready_structure/features/auth/data/data_source/auth_rds.dart';
import 'package:ready_structure/features/auth/data/model/user_model.dart';

abstract class AuthRepository {
  final AuthRDS rds;

  AuthRepository(this.rds);

  Future<Result<VoidApiResponse>> login(UserModel user);

  Future<Result<VoidApiResponse>> register(UserModel user);
}
