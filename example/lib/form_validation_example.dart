import 'package:advance_form_validators_example/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FormValidationExample extends StatelessWidget {
  const FormValidationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation'),
      ),
      body: ListView(
        children: const [
          TextValidation(),
          NumericValidation(),
          DateTimeValidation(),
          EmailPasswordValidation(),
          CombinedValidation(),
        ],
      ),
    );
  }
}
