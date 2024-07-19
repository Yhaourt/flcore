import 'package:flcore/ui/theme/fl_theme.dart';
import 'package:flutter/material.dart';

void showFlMenu<T>(
  BuildContext context, {
  required Widget child,
  required Offset position,
  required List<PopupMenuEntry<T>> items,
  required void Function(T value) onSelected,
}) {
  showMenu(
    context: context,
    elevation: 0,
    surfaceTintColor: Theme.of(context).colorScheme.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(FlTheme.borderRadius),
    ),
    position: RelativeRect.fromLTRB(
      position.dx,
      position.dy,
      position.dx,
      position.dy,
    ),
    items: items,
  ).then((value) {
    if (value != null) {
      onSelected(value);
    }
  });
}
