import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';

class NumberOnly extends BaseValidator {
  NumberOnly({
    super.onError,
    String? message,
  }) : super(message: message ?? ErrorMessage.numberOnly.message);

  /// Validate if [value] is number.
  /// Returns [message] if [value] is invalid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    if (!Regex.numberOnly.expression.hasMatch(value)) {
      return super.onError?.call(value) ?? message;
    }
    return null;
  }
}
