import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/validators/date_time_validations/date_format.dart';

class DateValidator {
  final List<BaseValidator> _validators;

  DateValidator({
    List<BaseValidator> validators = const [],
  }) : _validators = [
          DateFormatter(),
          ...validators,
        ];

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
