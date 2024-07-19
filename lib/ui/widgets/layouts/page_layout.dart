import 'package:flcore/ui/theme/fl_theme.dart';
import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  const PageLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        FlTheme.paddingLg,
        0,
        FlTheme.paddingLg,
        FlTheme.paddingLg,
      ),
      child: Column(
        children: [
          child,
        ],
      ),
    );
  }
}
