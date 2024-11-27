import 'package:advance_form_validators/advance_form_validators.dart';
import 'package:advance_form_validators_example/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EmailPasswordValidation extends StatelessWidget {
  const EmailPasswordValidation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Numeric Validators',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 16.0),
          CommonTextFormField(
            label: 'Username',
            validators: EmailPasswordValidator(
              validators: [
                Username(),
              ],
            ).validate,
          ),
          CommonTextFormField(
            label: 'Email',
            validators: EmailPasswordValidator(
              validators: [
                Email(),
              ],
            ).validate,
          ),
          CommonTextFormField(
            label: 'Password',
            validators: EmailPasswordValidator(
              validators: [
                Password(),
              ],
            ).validate,
          ),
          CommonTextFormField(
            label: 'Confirm Password',
            validators: EmailPasswordValidator(
              validators: [
                ConfirmPassword(password: 'Rupesh'),
              ],
            ).validate,
          ),
        ],
      ),
    );
  }
}
