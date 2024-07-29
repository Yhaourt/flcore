import 'package:flcore/ui/packs/color_packs.dart';
import 'package:flcore/ui/theme/fl_theme.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  ColorPicker({
    super.key,
    final ColorPickerController? controller,
    final List<ColorPack>? packs,
    this.onColorPicked,
  }) {
    _controller = controller ?? ColorPickerController();
    _packs = packs ?? ColorPacks.allPacks;
  }

  late final ColorPickerController _controller;
  late final List<ColorPack> _packs;
  final void Function(Color)? onColorPicked;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int currentPackIndex = 0;

  @override
  void initState() {
    super.initState();
    widget._controller.value ??= widget._packs[currentPackIndex].defaultColor;
    currentPackIndex = widget._packs.indexWhere(
      (pack) => pack.colors.contains(widget._controller.value),
    );
    currentPackIndex = currentPackIndex == -1 ? 0 : currentPackIndex;
    widget._controller.addListener(_updateState);
  }

  @override
  void didUpdateWidget(covariant ColorPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget._controller != widget._controller) {
      oldWidget._controller.removeListener(_updateState);
      widget._controller.addListener(_updateState);
    }
  }

  @override
  void dispose() {
    widget._controller.removeListener(_updateState);
    super.dispose();
  }

  void _updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget._packs.length,
          itemBuilder: (context, index) {
            return _buildBox(
              color: widget._packs[index].defaultColor,
              checked: widget._packs[index].colors.contains(
                widget._controller.value,
              ),
              onTap: (Color color) {
                setState(() {
                  currentPackIndex = index;
                });
              },
            );
          },
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 40,
            childAspectRatio: 1,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
        ),
        const SizedBox(height: 5),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget._packs[currentPackIndex].colors.length,
          itemBuilder: (context, index) {
            return _buildBox(
              color: widget._packs[currentPackIndex].colors[index],
              checked: widget._packs[currentPackIndex].colors[index] ==
                  widget._controller.value,
              onTap: (Color color) {
                setState(() {
                  widget._controller.value = color;
                  widget.onColorPicked?.call(color);
                });
              },
            );
          },
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 40,
            childAspectRatio: 1,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
        ),
      ],
    );
  }

  Widget _buildBox({
    required Color color,
    required Function(Color) onTap,
    bool checked = false,
  }) {
    return GestureDetector(
      onTap: () => onTap(color),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(FlTheme.borderRadius),
          border: Border.all(
            color: Theme.of(context).colorScheme.surfaceContainer,
            width: 1,
          ),
          color: color,
        ),
        child: checked
            ? Icon(
                Icons.check,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 15,
              )
            : null,
      ),
    );
  }
}

class ColorPickerController extends ValueNotifier<Color?> {
  ColorPickerController({Color? color}) : super(color);
}
