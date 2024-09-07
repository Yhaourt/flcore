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
    elevation: 1,
    color: Theme.of(context).colorScheme.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(FlTheme.borderRadiusMd),
    ),
    popUpAnimationStyle: AnimationStyle.noAnimation,
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
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        height: 40,
        color: _isHovered
            ? Theme.of(context).colorScheme.surfaceContainer
            : Theme.of(context).colorScheme.surface,
        child: GestureDetector(
          onTap: () => Navigator.pop(context, widget.value),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: FlTheme.paddingMd),
            child: Row(
              children: [
                if (widget.icon != null) ...[
                  Icon(
                    widget.icon,
                    color: widget.iconColor ??
                        Theme.of(context).colorScheme.onSurface,
                  ),
                  const SizedBox(width: FlTheme.spacingMd),
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
      ),
    );
  }
}
