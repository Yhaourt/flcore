import 'package:flcore/ui/widgets/loading/loader.dart';
import 'package:flutter/material.dart';
import 'package:flcore/ui/theme/fl_theme.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
    this.expanded = false,
    this.borderRadius,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool expanded;
  final double? borderRadius;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? double.infinity : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(50),
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(FlTheme.borderRadius),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: (isLoading)
            ? Loader(
                size: LoaderSize.sm,
                color: Theme.of(context).colorScheme.onPrimary)
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(
                      icon,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    const SizedBox(width: FlTheme.spacing),
                  ],
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
