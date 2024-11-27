import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';

class BeforeDate extends BaseValidator {
  final DateTime _beforeDate;

  BeforeDate({
    DateTime? beforeDate,
    String? message,
    super.onError,
  })  : _beforeDate = beforeDate ?? DateTime.now(),
        super(message: message ?? ErrorMessage.beforeDate.message);

  /// validate if [value] is before [_beforeDate]
  /// Returns [message] if invalid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;

    try {
      final parsedDate = DateTime.parse(value);
      if (parsedDate.isAfter(_beforeDate)) {
        return super.onError?.call(value) ??
            message.replaceAll('{beforeDate}',
                '${_beforeDate.year}-${_beforeDate.month}-${_beforeDate.day}');
      }
    } catch (e) {
      return ErrorMessage.dateGeneral.message;
    }

    return null;
  }
}
