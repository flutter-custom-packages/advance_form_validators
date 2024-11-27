import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';

class MinNumber extends BaseValidator {
  final int _minValue;

  MinNumber({
    int minValue = 10,
    super.onError,
    String? message,
  })  : _minValue = minValue,
        super(message: message ?? ErrorMessage.minValue.message);

  /// Validate if [value] is less than [_minValue].
  /// Returns [message] if [value] is invalid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;

    final numValue = double.tryParse(value);
    if (numValue == null || numValue < _minValue) {
      return super.onError?.call(value) ??
          message.replaceAll('{min}', _minValue.toString());
    }
    return null;
  }
}
