import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';

class NegativeNumber extends BaseValidator {
  NegativeNumber({
    String? message,
    super.onError,
  }) : super(message: message ?? ErrorMessage.negativeNumber.message);

  /// Validate if [value] is negative number.
  /// Returns [message] if [value] is invalid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    final numValue = double.tryParse(value);
    if (numValue == null || numValue > 0) {
      return super.onError?.call(value) ?? message;
    }
    return null;
  }
}
