import 'package:flcore/ui/theme/fl_theme.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    this.hintText = 'Rechercher',
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.onChanged,
  });

  final String hintText;
  final IconData? suffixIcon;
  final void Function()? onSuffixIconPressed;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        prefixIcon: Icon(Icons.search),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 13,
          horizontal: 15,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(FlTheme.borderRadius),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                color: Theme.of(context).colorScheme.onSurface,
                onPressed: onSuffixIconPressed,
              )
            : null,
      ),
    );
  }
}
