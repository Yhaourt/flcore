import 'package:flcore/ui/theme/fl_theme.dart';
import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  const PageLayout({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: padding ?? const EdgeInsets.all(FlTheme.paddingLg),
            child: child,
          ),
        ),
      ],
    );
  }
}
