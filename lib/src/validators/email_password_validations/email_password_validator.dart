import 'package:advance_form_validators/src/validators/base_validator.dart';

class EmailPasswordValidator {
  final List<BaseValidator> _validators;

  EmailPasswordValidator({
    List<BaseValidator> validators = const [],
  }) : _validators = validators;

  String? validate(String? value) {
    for (var validator in _validators) {
      final error = validator.validate(value);
      if (error != null) {
        return error;
      }
    }
    return null;
  }
}
