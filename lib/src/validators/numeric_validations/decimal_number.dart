import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';

class DecimalNumber extends BaseValidator {
  final int _decimalValue;

  DecimalNumber({
    int decimalValue = 2,
    String? message,
    super.onError,
  })  : _decimalValue = decimalValue,
        super(message: message ?? ErrorMessage.decimal.message);

  /// Validate if [value] is a decimal number
  /// It also checks if the number has at least [_decimalValue] decimal places
  /// Returns [message] if [value] is invalid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;

    if (!Regex.decimal.expression.hasMatch(value)) {
      return super.onError?.call(value) ?? ErrorMessage.decimal.message;
    }
    final regex = Regex.decimalValue.regex
        .replaceAll('{decimalValue}', _decimalValue.toString());
    if (!RegExp(regex).hasMatch(value)) {
      return super.onError?.call(value) ??
          ErrorMessage.decimalValue.message
              .replaceAll('{decimal}', _decimalValue.toString());
    }
    return null;
  }
}
