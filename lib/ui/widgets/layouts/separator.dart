import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator({
    super.key,
    this.topSpace = 20,
    this.bottomSpace = 20,
    this.width,
  });

  final double topSpace;
  final double bottomSpace;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: topSpace),
        SizedBox(
          width: width ?? double.infinity,
          child: Divider(
            height: 0,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        SizedBox(height: bottomSpace),
      ],
    );
  }
}
