import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';

showFlSnackBar(
    BuildContext context,
    String message, {
      Color? backgroundColor,
      Color? textColor,
    }) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: textColor ?? Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      backgroundColor:
      backgroundColor ?? Theme.of(context).colorScheme.secondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(FlTheme.borderRadiusMd),
          topRight: Radius.circular(FlTheme.borderRadiusMd),
        ),
      ),
    ),
  );
}
