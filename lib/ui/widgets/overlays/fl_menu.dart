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
    elevation: 1,
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
  double get height => 40;

  @override
  bool represents(T? value) {
    // TODO: implement represents
    throw UnimplementedError();
  }
}

class _FlMenuItemState<T> extends State<FlMenuItem<T>> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: GestureDetector(
        onTap: () => Navigator.pop(context, widget.value),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: FlTheme.padding),
          child: Row(
            children: [
              if (widget.icon != null) ...[
                const SizedBox(width: 8),
                Icon(
                  widget.icon,
                  color: widget.iconColor ??
                      Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                widget.text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: widget.textColor ??
                          Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
