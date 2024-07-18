import 'package:flcore/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ColoredCard extends StatelessWidget {
  const ColoredCard({
    super.key,
    required this.color,
    required this.child,
  });

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppTheme.padding),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppTheme.borderRadius),
        border: Border(
            left: BorderSide(
          color: color,
          width: 5,
        )),
      ),
      child: child,
    );
  }
}
