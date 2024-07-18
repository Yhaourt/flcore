import 'package:flcore/ui/widgets/async/loader.dart';
import 'package:flutter/material.dart';
import 'package:flcore/ui/theme/app_theme.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.expanded = false,
    this.borderRadius,
    this.loading = false,
  });

  final String text;
  final VoidCallback onPressed;
  final bool expanded;
  final double? borderRadius;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? double.infinity : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(50),
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.borderRadius),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: (loading)
            ? Loader(
                size: LoaderSize.small,
                color: Theme.of(context).colorScheme.onPrimary)
            : Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
      ),
    );
  }
}
