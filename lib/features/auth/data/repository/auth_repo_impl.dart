import 'package:ready_structure/core/networking/models/api/void_result/void_model.dart';
import 'package:ready_structure/core/networking/results/result.dart';
import 'package:ready_structure/features/auth/data/data_source/auth_rds_impl.dart';
import 'package:ready_structure/features/auth/data/model/user_model.dart';
import 'package:ready_structure/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRDSImpl rdsImpl;

  AuthRepositoryImpl({required this.rdsImpl}) : super(rdsImpl);

  @override
  Future<Result<VoidApiResponse>> login(UserModel user) {
    return rdsImpl.login(user);
  }

  @override
  Future<Result<VoidApiResponse>> register(UserModel user) {
    return rdsImpl.register(user);
  }
}
