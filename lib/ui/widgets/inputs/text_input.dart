import 'package:flutter/material.dart';
import 'package:flcore/ui/theme/fl_theme.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    required this.controller,
    this.hintText,
    this.value,
    this.onChanged,
    this.prefixIcon,
    this.onPrefixIconPressed,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.borderRadius,
    this.validator,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? value;
  final Function(String)? onChanged;
  final IconData? prefixIcon;
  final VoidCallback? onPrefixIconPressed;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final BorderRadius? borderRadius;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  void initState() {
    widget.controller.text = widget.value ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 13,
          horizontal: 15,
        ),
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon != null
            ? GestureDetector(
                onTap: widget.onPrefixIconPressed,
                child: Icon(
                  widget.prefixIcon,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : null,
        suffixIcon: widget.suffixIcon != null
            ? GestureDetector(
                onTap: widget.onSuffixIconPressed,
                child: Icon(
                  widget.suffixIcon,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(FlTheme.borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(FlTheme.borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
      ),
    );
  }
}
