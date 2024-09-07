import 'package:flcore/ui/theme/fl_theme.dart';
import 'package:flutter/material.dart';

class FlDrawer extends StatelessWidget {
  const FlDrawer({
    super.key,
    required this.child,
    this.width,
  });

  final Widget child;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: width,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(FlTheme.borderRadiusMd),
          bottomRight: Radius.circular(FlTheme.borderRadiusMd),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          FlTheme.paddingLg,
          FlTheme.paddingLg + MediaQuery.of(context).padding.top,
          FlTheme.paddingLg,
          FlTheme.paddingLg,
        ),
        child: child,
      ),
    );
  }
}
