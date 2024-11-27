import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/validators/date_time_validations/time_format.dart';
import 'package:flutter/material.dart';

class TimeValidator {
  final List<BaseValidator> _validators;

  TimeValidator({
    List<BaseValidator> validators = const [],
  }) : _validators = [
          TimeFormat(),
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

  /// Helper function to parse the time in format "HH:mm"
  TimeOfDay parseTime(String value) {
    final parts = value.split(':');
    if (parts.length != 2) throw const FormatException('Invalid time format');
    final hour = int.tryParse(parts[0]) ?? 0;
    final minute = int.tryParse(parts[1]) ?? 0;

    return TimeOfDay(hour: hour, minute: minute);
  }
}
