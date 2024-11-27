import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';
import 'package:advance_form_validators/src/validators/date_time_validations/date_time_validations.dart';
import 'package:flutter/material.dart';

class AfterTime extends BaseValidator {
  final TimeOfDay _afterTime;

  AfterTime({
    TimeOfDay? afterTime,
    String? message,
    super.onError,
  })  : _afterTime = afterTime ?? TimeOfDay.now(),
        super(message: message ?? ErrorMessage.afterTime.message);

  /// Validate if [value] is after [afterTime]
  /// Returns [message] if invalid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;

    try {
      final parsedTime = TimeValidator().parseTime(value);
      final afterTimeInMinutes = _afterTime.hour * 60 + _afterTime.minute;
      final parsedTimeInMinutes = parsedTime.hour * 60 + parsedTime.minute;

      if (parsedTimeInMinutes <= afterTimeInMinutes) {
        return super.onError?.call(value) ??
            message.replaceAll(
                '{afterTime}', '${_afterTime.hour}:${_afterTime.minute}');
      }
    } catch (e) {
      return ErrorMessage.timeGeneral.message;
    }

    return null;
  }
}
