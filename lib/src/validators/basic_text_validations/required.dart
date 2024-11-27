import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';

class Required extends BaseValidator {
  Required({
    String? message,
    super.onError,
  }) : super(message: message ?? ErrorMessage.required.message);

  /// Validate if [value] is null or empty.
  /// Returns [message] if invalid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return super.onError?.call(value) ?? message;
    }
    return null;
  }
}
