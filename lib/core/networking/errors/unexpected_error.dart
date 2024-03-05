
import 'base_error.dart';

class UnExpectedError extends BaseError {
  String? errorMessage;
  UnExpectedError({this.errorMessage}) : super("UnExpectedError");
}
