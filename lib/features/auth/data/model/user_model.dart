import 'dart:convert';

import 'package:ready_structure/core/networking/models/api/data/base_api_model.dart';

class UserModel extends BaseApiDataModel {
  final String email;
  final String name;
  final String? password;

  UserModel({required this.email, required this.name,  this.password});

  @override
  toJson() {
    return jsonEncode({
      "email": email,
      "name": name,
    });
  }

  factory UserModel.fromJson(String jsonString) {
    Map<String, dynamic> map = jsonDecode(jsonString);

    return UserModel(
      name: map["name"],
      email: map["email"],
    );
  }
}
