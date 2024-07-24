import 'package:flcore/ui/packs/color_packs.dart';
import 'package:flcore/ui/theme/fl_theme.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  ColorPicker({
    super.key,
    final ColorPickerController? controller,
    required final List<ColorPack> packs,
    this.onColorPicked,
  }) {
    _controller = controller ?? ColorPickerController();
    _pickerColors = packs.map((pack) => pack.pack).toList();
  }

  late final ColorPickerController _controller;
  late final List<List<Color>> _pickerColors;
  final void Function(Color)? onColorPicked;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int currentPaletteIndex = 0;

  @override
  void initState() {
    super.initState();
    widget._controller.value ??= widget._pickerColors[currentPaletteIndex][4];
    currentPaletteIndex = widget._pickerColors
        .indexWhere((palette) => palette.contains(widget._controller.value));
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
          itemCount: widget._pickerColors.length,
          itemBuilder: (context, index) {
            return _buildBox(
              color: widget._pickerColors[index][4],
              checked:
                  widget._pickerColors[index][4] == widget._controller.value,
              onTap: (Color color) {
                setState(() {
                  currentPaletteIndex = index;
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
          itemCount: widget._pickerColors[currentPaletteIndex].length,
          itemBuilder: (context, index) {
            return _buildBox(
              color: widget._pickerColors[currentPaletteIndex][index],
              checked: widget._pickerColors[currentPaletteIndex][index] ==
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
