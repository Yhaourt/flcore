import 'package:flutter/material.dart';

enum LoaderSize { sm, md, lg }

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.color,
    this.size = LoaderSize.md,
  });

  final Color? color;
  final LoaderSize size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: size == LoaderSize.sm
            ? 0.5
            : size == LoaderSize.md
                ? 0.75
                : 1,
        child: CircularProgressIndicator(
          color: color ?? Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
