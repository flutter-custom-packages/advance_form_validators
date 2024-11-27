
import 'package:advance_form_validators/src/validators/base_validator.dart';
import 'package:advance_form_validators/src/constants/constants.dart';


class ExactLength extends BaseValidator {
  final int _length;

  ExactLength({
    int length = 5,
    String? message,
    super.onError,
  })  : _length = length,
        super(
          message: message ?? ErrorMessage.exactLength.message,
        );

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    if (value.length != _length) {
      return super.onError?.call(value) ?? message.replaceAll('{length}', _length.toString());
    }
    return null;
  }
}
