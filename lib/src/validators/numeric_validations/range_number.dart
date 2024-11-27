import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';

class RangeNumber extends BaseValidator {
  final int _minValue;
  final int _maxValue;

  RangeNumber({
    String? message,
    super.onError,
    int minValue = 0,
    int maxValue = 100,
  })  : _maxValue = maxValue,
        _minValue = minValue,
        super(message: message ?? ErrorMessage.numberRange.message);

  /// Validate if [value] is in between [_minValue] and [_maxValue]
  /// Returns [message] if [value] is invalid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    final numValue = double.tryParse(value);
    if (numValue == null || numValue < _minValue || numValue > _maxValue) {
      return super.onError?.call(value) ??
          message
              .replaceAll('{min}', _minValue.toString())
              .replaceAll('{max}', _maxValue.toString());
    }
    return null;
  }
}
