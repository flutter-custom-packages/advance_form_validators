import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';

class MinLength extends BaseValidator {
  final int _minLength;

  MinLength({
    int minLength = 5,
    String? message,
    super.onError,
  })  : _minLength = minLength,
        super(
          message: message ?? ErrorMessage.minLength.message,
        );

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    if (value.length < _minLength) {
      return super.onError?.call(value) ??
          message.replaceAll('{min}', _minLength.toString());
    }
    return null;
  }
}
