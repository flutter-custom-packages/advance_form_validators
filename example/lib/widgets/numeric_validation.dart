import 'package:advance_form_validators/advance_form_validators.dart';
import 'package:advance_form_validators_example/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NumericValidation extends StatelessWidget {
  const NumericValidation({super.key});

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
            label: 'Decimal Number',
            validators: NumericValidator(
              validators: [
                DecimalNumber(),
              ],
            ).validate,
          ),
          CommonTextFormField(
            label: 'Max Number',
            validators: NumericValidator(
              validators: [
                MaxNumber(),
              ],
            ).validate,
          ),
          CommonTextFormField(
            label: 'Min Number',
            validators: NumericValidator(
              validators: [
                MinNumber(),
              ],
            ).validate,
          ),
          CommonTextFormField(
            label: 'Negative Number',
            validators: NumericValidator(
              validators: [
                NegativeNumber(),
              ],
            ).validate,
          ),
          CommonTextFormField(
            label: 'Positive Number',
            validators: NumericValidator(
              validators: [
                PositiveNumber(),
              ],
            ).validate,
          ),
          CommonTextFormField(
            label: 'Number Only',
            validators: NumericValidator(
              validators: [
                NumberOnly(),
              ],
            ).validate,
          ),
          CommonTextFormField(
            label: 'Range Number',
            validators: NumericValidator(
              validators: [
                RangeNumber(),
              ],
            ).validate,
          ),
        ],
      ),
    );
  }
}
