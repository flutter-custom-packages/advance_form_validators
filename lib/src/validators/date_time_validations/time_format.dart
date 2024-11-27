import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';
import 'package:intl/intl.dart';

class TimeFormat extends BaseValidator {
  final String _format;

  TimeFormat({
    String format = 'HH:mm',
    String? message,
    super.onError,
  })  : _format = format,
        super(message: message ?? ErrorMessage.timeFormat.message);

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;

    try {
      final timeFormat = DateFormat(_format);
      timeFormat.parseStrict(value);
    } catch (e) {
      return super.onError?.call(value) ?? message.replaceAll('{formatType}', _format);
    }

    return null;
  }
}
