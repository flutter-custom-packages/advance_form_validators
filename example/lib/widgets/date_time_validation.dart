import 'package:advance_form_validators/advance_form_validators.dart';
import 'package:advance_form_validators_example/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DateTimeValidation extends StatelessWidget {
  const DateTimeValidation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Date Time Validators',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 16.0),
          CommonTextFormField(
            label: 'After Date',
            validators: DateValidator(validators: [AfterDate()]).validate,
          ),
          CommonTextFormField(
            label: 'Before Date',
            validators: DateValidator(validators: [BeforeDate()]).validate,
          ),
          CommonTextFormField(
            label: 'Date Format',
            validators: DateValidator(validators: [DateFormatter()]).validate,
          ),
          CommonTextFormField(
            label: 'Date Range',
            validators: DateValidator(validators: [DateRange()]).validate,
          ),
          CommonTextFormField(
            label: 'After Time',
            validators: TimeValidator(validators: [AfterTime()]).validate,
          ),
          CommonTextFormField(
            label: 'Before Time',
            validators: TimeValidator(validators: [BeforeTime()]).validate,
          ),
          CommonTextFormField(
            label: 'Time Format',
            validators: TimeValidator(validators: [TimeFormat()]).validate,
          ),
          CommonTextFormField(
            label: 'Time Range',
            validators: TimeValidator(validators: [TimeRange()]).validate,
          ),
        ],
      ),
    );
  }
}
