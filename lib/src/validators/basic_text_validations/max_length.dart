import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';


class MaxLength extends BaseValidator {
  final int _maxLenght;

  MaxLength({
    int maxLength = 10,
    String? message,
    super.onError,
  })  : _maxLenght = maxLength,
        super(message: message ?? ErrorMessage.maxLength.message);

  /// Validate if lenght of [value] is less than [maxLenght].
  /// Returns [message] if invalid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    if (value.length > _maxLenght) {
      return super.onError?.call(value) ?? message.replaceAll('{max}', _maxLenght.toString());
    }
    return null;
  }
}
