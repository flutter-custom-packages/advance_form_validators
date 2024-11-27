import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';

class Username extends BaseValidator {
  final int _minLength;

  Username({
    int minLength = 8,
    String? message,
    super.onError,
  })  : _minLength = minLength,
        super(message: message ?? ErrorMessage.username.message);

  /// Validate if [value] is valid or not.
  /// Returns [message] if [value] is not valid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    if (value.length < _minLength) {
      return super.onError?.call(value) ??
          ErrorMessage.minimumLenght.message
              .replaceAll('{min}', _minLength.toString());
    }
    if (!Regex.username.expression.hasMatch(value)) {
      return super.onError?.call(value) ?? message;
    }
    return null;
  }
}
