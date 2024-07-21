import 'package:flcore/flcore.dart';
import 'package:flcore/ui/theme/fl_theme.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText = 'Rechercher',
    this.suffixIcon,
    this.onSuffixIconPressed,
  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String hintText;
  final IconData? suffixIcon;
  final void Function()? onSuffixIconPressed;

  @override
  Widget build(BuildContext context) {
    return TextInput(
      controller: controller,
      onChanged: onChanged,
      textInputStyle: TextInputStyle.noBorder,
      hintText: hintText,
      prefixIcon: Icons.search,
    );
  }
}
