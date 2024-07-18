import 'package:flutter/material.dart';

enum LoaderSize { small, medium, large }

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.color,
    this.size = LoaderSize.medium,
  });

  final Color? color;
  final LoaderSize size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: size == LoaderSize.small
            ? 0.5
            : size == LoaderSize.medium
                ? 0.75
                : 1,
        child: CircularProgressIndicator(
          color: color ?? Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
