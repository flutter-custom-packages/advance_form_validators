abstract class BaseValidator {
  final String message;
  final String? Function(String?)? onError;

  BaseValidator({
    required this.message,
    this.onError,
  });

  String? validate(String? value) {
    if (onError != null) {
      return onError!(value);
    }
    return null;
  }
}
