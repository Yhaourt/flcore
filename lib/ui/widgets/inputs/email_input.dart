import 'package:flcore/ui/widgets/inputs/text_input.dart';
import 'package:flcore/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    super.key,
    required this.controller,
    this.needsValidation = true,
  });

  final TextEditingController controller;
  final bool needsValidation;

  @override
  Widget build(BuildContext context) {
    return TextInput(
      controller: controller,
      label: 'Email',
      prefixIcon: Icons.email,
      validator: (value) {
        if (!needsValidation) {
          return null;
        }
        if (value == null || value.isEmpty) {
          return 'Veuillez entrer votre email';
        }
        if (!value.isValidEmail()) {
          return 'Veuillez entrer un email valide';
        }
        return null;
      },
    );
  }
}
