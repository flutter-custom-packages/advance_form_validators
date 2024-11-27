import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';

class DateRange extends BaseValidator {
  final DateTime _startDate;
  final DateTime _endDate;

  DateRange({
    DateTime? startDate,
    DateTime? endDate,
    String? message,
    super.onError,
  })  : _startDate = startDate ?? DateTime.now(),
        _endDate = endDate ?? DateTime.now().add(const Duration(days: 1000)),
        super(message: message ?? ErrorMessage.dateRange.message);

  /// validate if [value] is in between [startDate] and [endDate]
  /// Returns [message] if invalid.
  /// Returns `null` otherwise.
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    try {
      final parsedDate = DateTime.parse(value);
      if (parsedDate.isBefore(_startDate) || parsedDate.isAfter(_endDate)) {
        return super.onError?.call(value) ??
            message
                .replaceAll('{startDate}',
                    '${_startDate.year}-${_startDate.month}-${_startDate.day}')
                .replaceAll('{endDate}',
                    '${_endDate.year}-${_endDate.month}-${_endDate.day}');
      }
    } catch (e) {
      return ErrorMessage.dateGeneral.message;
    }
    return null;
  }
}
