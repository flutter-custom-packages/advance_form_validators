import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';

class RegexPattern extends BaseValidator {
  final RegExp _pattern;

  RegexPattern({
    RegExp? pattern,
    String? message,
    super.onError,
  })  : _pattern = pattern ?? Regex.general.expression,
        super(message: message ?? ErrorMessage.pattern.message);

  /// Validate if  [value] matches the [pattern]
  /// Returns [message] if invalid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    if (!_pattern.hasMatch(value)) {
      return super.onError?.call(value) ?? message;
    }
    return null;
  }
}
