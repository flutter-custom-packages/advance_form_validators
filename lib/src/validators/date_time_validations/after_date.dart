import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';


class AfterDate extends BaseValidator {
  final DateTime _afterDate;

  AfterDate({
    DateTime? afterDate,
    String? message,
    super.onError,
  })  : _afterDate = afterDate ?? DateTime.now(),
        super(message: message ?? ErrorMessage.afterDate.message);

  /// validate if [value] is after [_afterDate]
  /// Returns [message] if invalid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;

    try {
      final parsedDate = DateTime.parse(value);
      if (parsedDate.isBefore(_afterDate)) {
        return super.onError?.call(value) ??
            message.replaceAll(
                '{afterDate}', '${_afterDate.year}-${_afterDate.month}-${_afterDate.day}');
      }
    } catch (e) {
      return ErrorMessage.dateGeneral.message;
    }

    return null;
  }
}
