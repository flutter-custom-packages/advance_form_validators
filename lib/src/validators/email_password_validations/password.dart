import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';

class Password extends BaseValidator {
  final int _minimumPasswordLength;
  final bool _isUpperCaseRequired;
  final bool _isLowerCaseRequired;
  final bool _isNumberRequired;

  Password({
    int minimumPasswordLength = 8,
    bool isUpperCaseRequired = true,
    bool isLowerCaseRequired = true,
    bool isNumberRequired = true,
    String? message,
    super.onError,
  })  : _isLowerCaseRequired = isLowerCaseRequired,
        _isNumberRequired = isNumberRequired,
        _isUpperCaseRequired = isUpperCaseRequired,
        _minimumPasswordLength = minimumPasswordLength,
        super(message: message ?? ErrorMessage.passwordStrength.message);

  /// Validate if [value] is a valid password under above condition
  /// Returns [message] if invalid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    if (value.length < _minimumPasswordLength) {
      return super.onError?.call(value) ??
          ErrorMessage.minimumLenght.message.replaceAll('{min}', _minimumPasswordLength.toString());
    }
    if (_isUpperCaseRequired && !value.contains(Regex.containsUppercase.expression)) {
      return super.onError?.call(value) ?? ErrorMessage.uppercase.message;
    }
    if (_isLowerCaseRequired && !value.contains(Regex.containsLowercase.expression)) {
      return super.onError?.call(value) ?? ErrorMessage.lowercase.message;
    }
    if (_isNumberRequired && !value.contains(Regex.containsNumber.expression)) {
      return super.onError?.call(value) ?? ErrorMessage.number.message;
    }
    return null;
  }
}
