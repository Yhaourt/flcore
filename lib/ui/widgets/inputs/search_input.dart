import 'package:flcore/ui/theme/fl_theme.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    this.hintText = 'Rechercher ...',
    this.trailing,
    this.onTrailingPressed,
    this.onChanged,
  });

  final String hintText;
  final Widget? trailing;
  final void Function()? onTrailingPressed;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: Theme.of(context).textTheme.bodyLarge,
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
        suffixIcon: trailing != null
            ? IconButton(
                icon: trailing!,
                onPressed: onTrailingPressed,
              )
            : null,
      ),
    );
  }
}
