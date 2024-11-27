import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';

class Email extends BaseValidator {
  Email({
    String? message,
    super.onError,
  }) : super(message: message ?? ErrorMessage.email.message);

  /// validate if [value] is valid email;
  /// returns [message] if invalid.
  /// returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    if (!Regex.email.expression.hasMatch(value)) {
      return super.onError?.call(value) ?? message;
    }
    return null;
  }
}
