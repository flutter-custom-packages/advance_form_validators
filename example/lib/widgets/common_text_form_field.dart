import 'package:flutter/material.dart';

class CommonTextFormField extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validators;

  const CommonTextFormField({
    super.key,
    required this.label,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.validators,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: validators,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
