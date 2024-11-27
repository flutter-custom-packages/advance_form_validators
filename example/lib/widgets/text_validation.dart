import 'package:advance_form_validators/advance_form_validators.dart';
import 'package:advance_form_validators_example/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextValidation extends StatelessWidget {
  const TextValidation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Text Validators',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 16.0),
          CommonTextFormField(
            label: 'Required',
            validators: TextValidator(
              validators: [
                Required(),
              ],
            ).validate,
          ),
          CommonTextFormField(
            label: 'Max Lenght',
            validators: TextValidator(
              validators: [
                MaxLength(),
              ],
            ).validate,
          ),
          CommonTextFormField(
            label: 'Min Lenght',
            validators: TextValidator(
              validators: [
                MinLength(),
              ],
            ).validate,
          ),
          CommonTextFormField(
            label: 'Pattern',
            validators: TextValidator(
              validators: [
                RegexPattern(pattern: RegExp(r'^[a-zA-Z0-9]+$')),
              ],
            ).validate,
          ),
          CommonTextFormField(
            label: 'Length Range',
            validators: TextValidator(
              validators: [
                LengthRange(
                  maxLenght: 10,
                ),
              ],
            ).validate,
          ),
          CommonTextFormField(
            label: 'Exact Length ',
            validators: TextValidator(
              validators: [
                ExactLength(
                  length: 7,
                ),
              ],
            ).validate,
          ),
        ],
      ),
    );
  }
}
