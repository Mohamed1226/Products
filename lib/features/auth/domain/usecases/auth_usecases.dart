import 'package:ready_structure/core/networking/models/api/void_result/void_model.dart';
import 'package:ready_structure/core/networking/results/result.dart';
import 'package:ready_structure/features/auth/data/model/user_model.dart';
import 'package:ready_structure/features/auth/domain/repository/auth_repository.dart';

class AuthUseCase {
  late AuthRepository _repository;

  AuthUseCase({required AuthRepository repository}) {
    _repository = repository;
  }

  Future<Result<VoidApiResponse>> login(UserModel user) {
    return _repository.login(user);
  }

  Future<Result<VoidApiResponse>> register(UserModel user) {
    return _repository.register(user);
  }
}
