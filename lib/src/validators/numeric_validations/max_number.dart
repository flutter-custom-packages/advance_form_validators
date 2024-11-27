import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';

class MaxNumber extends BaseValidator {
  final int _maxValue;
  MaxNumber({
    int maxValue = 20,
    String? message,
    super.onError,
  })  : _maxValue = maxValue,
        super(message: message ?? ErrorMessage.maxValue.message);

  /// Validate if [value] is less than [_maxValue].
  /// Returns [message] if [value] is invalid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    final numValue = double.tryParse(value);
    if (numValue == null || numValue > _maxValue) {
      return super.onError?.call(value) ?? message.replaceAll('{max}', _maxValue.toString());
    }
    return null;
  }
}
