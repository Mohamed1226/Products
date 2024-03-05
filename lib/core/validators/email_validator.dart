import '../app_localization/app_localization.dart';
import 'base_validators.dart';

class EmailValidator extends BaseValidator {
  @override
  String getMessage() {
    return "not valid email";
  }

  @override
  bool validate(String? value) {
    final String emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(emailPattern);
    return value != null && value.trim().isNotEmpty && regExp.hasMatch(value);
  }
}
