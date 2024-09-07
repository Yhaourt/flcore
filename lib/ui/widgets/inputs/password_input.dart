import 'package:flcore/ui/widgets/inputs/text_input.dart';
import 'package:flcore/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    super.key,
    required this.controller,
    this.needsValidation = true,
  });

  final TextEditingController controller;
  final bool needsValidation;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return TextInput(
      controller: widget.controller,
      label: 'Mot de passe',
      prefixIcon: Icons.lock,
      suffixIcon: Icons.visibility,
      onSuffixIconPressed: () {
        setState(() {
          hidden = !hidden;
        });
      },
      obscureText: hidden,
      validator: (value) {
        if (!widget.needsValidation) {
          return null;
        }
        if (value == null || value.isEmpty) {
          return 'Veuillez entrer votre mot de passe';
        }
        if (!value.isValidPassword()) {
          return 'Veuillez entrer un mot de passe valide';
        }
        return null;
      },
    );
  }
}
