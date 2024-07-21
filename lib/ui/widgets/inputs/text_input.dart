import 'package:flutter/material.dart';
import 'package:flcore/ui/theme/fl_theme.dart';

enum TextInputStyle { classic, noBorder }

class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    this.controller,
    this.onChanged,
    this.textInputStyle = TextInputStyle.classic,
    this.hintText,
    this.prefixIcon,
    this.onPrefixIconPressed,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.validator,
    this.obscureText = false,
    this.autofillHints,
  });

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputStyle textInputStyle;
  final String? hintText;
  final IconData? prefixIcon;
  final VoidCallback? onPrefixIconPressed;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final String? Function(String?)? validator;
  final bool obscureText;
  final List<String>? autofillHints;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          validator: (value) {
            if (widget.validator != null) {
              setState(() {
                _errorMessage = widget.validator!(value);
              });
            }
            return _errorMessage;
          },
          obscureText: widget.obscureText,
          autofillHints: widget.autofillHints,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceContainer,
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
            border: _buildInputBorder(
                context, Theme.of(context).colorScheme.primary),
            enabledBorder: _buildInputBorder(
                context, Theme.of(context).colorScheme.primary),
            focusedBorder: _buildInputBorder(
                context, Theme.of(context).colorScheme.primary),
            errorBorder:
                _buildInputBorder(context, Theme.of(context).colorScheme.error),
            focusedErrorBorder:
                _buildInputBorder(context, Theme.of(context).colorScheme.error),
            errorStyle: const TextStyle(fontSize: 0),
          ),
        ),
        if (_errorMessage != null) ...[
          const SizedBox(height: 4),
          Text(
            _errorMessage!,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
        ]
      ],
    );
  }

  OutlineInputBorder _buildInputBorder(BuildContext context, Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(FlTheme.borderRadius),
      borderSide: (widget.textInputStyle == TextInputStyle.noBorder)
          ? BorderSide.none
          : BorderSide(
              color: color,
              width: 2,
            ),
    );
  }
}
