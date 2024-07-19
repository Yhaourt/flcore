import 'package:flcore/ui/theme/fl_theme.dart';
import 'package:flutter/material.dart';

showFlDialog({
  required BuildContext context,
  required Widget child,
}) {
  showDialog(
    context: context,
    builder: (context) => FlDialog(child: child),
  );
}

class FlDialog extends StatelessWidget {
  const FlDialog({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 650,
        ),
        child: Dialog(
          insetPadding: EdgeInsets.all(FlTheme.paddingLg),
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(FlTheme.borderRadius),
          ),
          child: Padding(
            padding: EdgeInsets.all(FlTheme.paddingLg),
            child: child,
          ),
        ),
      ),
    );
  }
}
