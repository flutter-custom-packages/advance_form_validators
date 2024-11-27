import 'package:advance_form_validators/src/validators/date_time_validations/time_validator.dart';
import 'package:flutter/material.dart';import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';

class TimeRange extends BaseValidator {
  final TimeOfDay _startTime;
  final TimeOfDay _endTime;

  TimeRange({
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    String? message,
    super.onError,
  })  : _startTime = startTime ?? TimeOfDay.now(),
        _endTime =
            endTime ?? TimeOfDay(hour: TimeOfDay.now().hour + 5, minute: TimeOfDay.now().minute),
        super(message: message ?? ErrorMessage.timeRange.message);

  /// Validate if [value] is between [_startTime] and [_endTime].
  /// Returns [message] if invalid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;

    try {
      final parsedTime = TimeValidator().parseTime(value);
      final startTimeInMinutes = _startTime.hour * 60 + _startTime.minute;
      final endTimeInMinutes = _endTime.hour * 60 + _endTime.minute;
      final parsedTimeInMinutes = parsedTime.hour * 60 + parsedTime.minute;

      if (parsedTimeInMinutes < startTimeInMinutes || parsedTimeInMinutes > endTimeInMinutes) {
        return super.onError?.call(value) ??
            message
                .replaceAll('{startTime}', '${_startTime.hour}:${_startTime.minute}')
                .replaceAll('{endTime}', '${_endTime.hour}:${_endTime.minute}');
      }
    } catch (e) {
      return ErrorMessage.timeGeneral.message;
    }

    return null;
  }
}
