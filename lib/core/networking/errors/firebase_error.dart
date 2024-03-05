import 'package:equatable/equatable.dart';
import 'base_error.dart';

class FirebaseError extends BaseError with EquatableMixin {
  final String error;

  FirebaseError(this.error) : super(error);

  @override
  List<Object?> get props => [message];
}
