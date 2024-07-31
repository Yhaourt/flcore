import 'package:flcore/ui/widgets/loading/loader.dart';
import 'package:flutter/material.dart';
import 'package:flcore/ui/theme/fl_theme.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.text,
    this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.expanded = false,
    this.thin = false,
    this.isLoading = false,
  });

  final String? text;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final bool expanded;
  final bool thin;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? double.infinity : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: thin ? FlTheme.padding : FlTheme.padding / 2,
            vertical: thin ? FlTheme.paddingSm : FlTheme.paddingSm / 2,
          ),
          fixedSize: Size.fromHeight(thin ? 38 : 50),
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.primary,
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
                    if (text != null) const SizedBox(width: FlTheme.spacing),
                  ],
                  if (text != null)
                    Text(
                      text!,
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
