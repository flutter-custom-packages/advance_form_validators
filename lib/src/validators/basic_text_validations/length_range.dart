import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';


class LengthRange extends BaseValidator {
  final int _minLenght;
  final int _maxLenght;

  LengthRange({
    int minLenght = 0,
    int maxLenght = 100,
    String? message,
    super.onError,
  })  : _minLenght = minLenght,
        _maxLenght = maxLenght,
        super(message: message ?? ErrorMessage.lengthRange.message) {
    assert(
      minLenght <= maxLenght,
      'Min length should be less than max length',
    );
  }

  /// Validate if length of [value] is in between [_minLenght] and [_maxLenght].
  /// Returns [message] if [value is invalid].
  /// Return `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    if (value.length < _minLenght || value.length > _maxLenght) {
      return super.onError?.call(value) ??
          message
              .replaceAll('{min}', _minLenght.toString())
              .replaceAll('{max}', _maxLenght.toString());
    }
    return null;
  }
}
