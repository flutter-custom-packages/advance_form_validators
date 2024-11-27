import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/validators/numeric_validations/numeric_validations.dart';

class NumericValidator {
  final List<BaseValidator> _validators;

  NumericValidator({
    List<BaseValidator> validators = const [],
  }) : _validators = [
          NumberOnly(),
          ...validators,
        ] {
    final hasNegative = validators.any((v) => v is NegativeNumber);
    final hasPositive = validators.any((v) => v is PositiveNumber);
    assert(
      !(hasNegative && hasPositive),
      'Cannot have both PositiveNumber and NegativeNumber validators at the same time.',
    );
  }

  /// Validate if [value] passes alll the [validators].
  /// Returns [message] if [value] is invalid.
  /// Returns `null` otherwise.

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
