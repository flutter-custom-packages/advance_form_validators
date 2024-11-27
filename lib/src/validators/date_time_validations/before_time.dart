import 'package:advance_form_validators/src/constants/constants.dart';
import 'package:advance_form_validators/src/validators/validators.dart';
import 'package:flutter/material.dart';

class BeforeTime extends BaseValidator {
  final TimeOfDay _beforeTime;

  BeforeTime({
    TimeOfDay? beforeTime,
    String? message,
    super.onError,
  })  : _beforeTime = beforeTime ?? TimeOfDay.now(),
        super(message: message ?? ErrorMessage.beforeTime.message);

  /// Validate if [value] is before [beforeTime]
  /// Returns [message] if invalid.
  /// Returns `null` otherwise.

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;

    try {
      final parsedTime = TimeValidator().parseTime(value);
      final afterTimeInMinutes = _beforeTime.hour * 60 + _beforeTime.minute;
      final parsedTimeInMinutes = parsedTime.hour * 60 + parsedTime.minute;

      if (parsedTimeInMinutes >= afterTimeInMinutes) {
        return super.onError?.call(value) ??
            message.replaceAll(
                '{beforeTime}', '${_beforeTime.hour}:${_beforeTime.minute}');
      }
    } catch (e) {
      return ErrorMessage.timeGeneral.message;
    }

    return null;
  }
}
