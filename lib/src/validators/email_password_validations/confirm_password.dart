import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';

class ConfirmPassword extends BaseValidator {
  final String _password;

  ConfirmPassword({
    required String password,
    String? message,
    super.onError,
  })  : _password = password,
        super(message: message ?? ErrorMessage.confirmPassword.message);

  /// Validate if [value] is same as [_password]
  /// Returns [message] if invalid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    if (value != _password) {
      return super.onError?.call(value) ?? message;
    }
    return null;
  }
}
