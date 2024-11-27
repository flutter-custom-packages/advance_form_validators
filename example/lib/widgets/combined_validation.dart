import 'package:advance_form_validators/advance_form_validators.dart';
import 'package:advance_form_validators_example/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CombinedValidation extends StatelessWidget {
  const CombinedValidation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Combined Validators',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 16.0),
          CommonTextFormField(
            label: 'Name',
            validators: TextValidator(
              validators: [
                Required(),
                MinLength(minLength: 6),
              ],
            ).validate,
          ),
          CommonTextFormField(
            label: 'Phone Number',
            validators: TextValidator(
              validators: [
                Required(),
                NumberOnly(),
                ExactLength(length: 10),
              ],
            ).validate,
          ),
          CommonTextFormField(
            label: 'Date of Birth',
            validators: DateValidator(
              validators: [
                Required(),
                BeforeDate(beforeDate: DateTime(2000)),
              ],
            ).validate,
          ),
        ],
      ),
    );
  }
}
