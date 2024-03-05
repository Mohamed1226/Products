import 'package:ready_structure/core/networking/models/api/data/base_api_model.dart';

class UserModel extends BaseApiDataModel {
  final String email;
  final String name;
  final String password;

  UserModel({required this.email, required this.name, required this.password});

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
