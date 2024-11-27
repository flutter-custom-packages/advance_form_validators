# Material Nepali Month/Year Picker

[![Pub](https://img.shields.io/pub/v/advance_form_validators?style=flat-square)](https://pub.dev/packages/advance_form_validators)

A comprehensive Flutter package for form validation, offering built-in support for text, email, password, numeric, date, and advanced custom validations.

## Quick Start

1. Open your `pubspec.yaml` file and add this entry:

    ```yaml
    advance_form_validators: ^0.0.1+1
    ```

   OR just run `flutter pub add advance_form_validators` using your preferred terminal app.

2. Then run `flutter pub get`.
3. Import this library into your code:

    ```dart
    import 'package:nepali_month_year_picker/nepali_month_year_picker.dart';
    ```
    
4. Usage in code:

    ```dart
   TextFormField(
            validator: DateValidator(
              validators: [
                Required(),
                BeforeDate(beforeDate: DateTime(2000)),
              ],
            ).validate,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
    ```
## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/kojurohan42/nepali-month-year-picker/blob/master/LICENSE) file for details.

[pub]: https://pub.dartlang.org/packages/advance_form_validators
[tracker]: https://github.com/flutter-custom-packages/advance_form_validators/issues
[license]: LICENSE