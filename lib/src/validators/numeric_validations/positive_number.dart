import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';

class PositiveNumber extends BaseValidator {
  PositiveNumber({
    String? message,
    super.onError,
  }) : super(message: message ?? ErrorMessage.positiveNumber.message);

  /// Validate if [value] is positive number.
  /// Returns [message] if [value] is invalid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    final numValue = double.tryParse(value);
    if (numValue == null || numValue < 0) {
      return super.onError?.call(value) ?? message;
    }
    return null;
  }
}
