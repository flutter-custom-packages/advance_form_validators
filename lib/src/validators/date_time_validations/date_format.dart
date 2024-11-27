import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';
import 'package:intl/intl.dart';

class DateFormatter extends BaseValidator {
  final String _format;

  DateFormatter({
    String format = 'yyyy-MM-dd',
    String? message,
    super.onError,
  })  : _format = format,
        super(message: message ?? ErrorMessage.dateFormat.message);

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;

    try {
      final DateFormat dateFormat = DateFormat(_format);
      dateFormat.parseStrict(value);
    } catch (e) {
      return super.onError?.call(value) ??
          message.replaceAll('{formatType}', _format);
    }

    return null;
  }
}
