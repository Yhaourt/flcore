import 'package:flcore/ui/theme/fl_theme.dart';
import 'package:flutter/material.dart';

void showFlMenu<T>(
  BuildContext context, {
  required Offset position,
  required List<FlMenuItem<T>> items,
  required void Function(T value) onSelected,
}) {
  showMenu(
    context: context,
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

class FlMenuItem<T> extends PopupMenuEntry<T> {
  const FlMenuItem({
    required this.text,
    this.textColor,
    this.icon,
    this.iconColor,
    required this.value,
  });

  final String text;
  final Color? textColor;
  final IconData? icon;
  final Color? iconColor;
  final T value;

  @override
  State<StatefulWidget> createState() => _FlMenuItemState<T>();

  @override
  // TODO: implement height
  double get height => throw UnimplementedError();

  @override
  bool represents(T? value) {
    // TODO: implement represents
    throw UnimplementedError();
  }
}

class _FlMenuItemState<T> extends State<FlMenuItem<T>> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.text,
        style: TextStyle(
          color: widget.textColor ?? Theme.of(context).colorScheme.onSurface,
        ),
      ),
      leading: widget.icon != null
          ? Icon(
              widget.icon,
              color:
                  widget.iconColor ?? Theme.of(context).colorScheme.onSurface,
            )
          : null,
      onTap: () {
        Navigator.pop(context, widget.value);
      },
    );
  }
}
