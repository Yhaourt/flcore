import 'package:flcore/ui/theme/fl_theme.dart';
import 'package:flcore/utils/helpers/color_helper.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  ColorPicker({
    super.key,
    final ColorPickerController? controller,
    this.onColorPicked,
  }) {
    _controller = controller ?? ColorPickerController();
  }

  late final ColorPickerController _controller;
  final void Function(Color)? onColorPicked;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  final List<List<Color>> palettes = colorPalettes();
  int currentPaletteIndex = 0;
  late Color selectedColor;

  @override
  void initState() {
    super.initState();
    selectedColor =
        widget._controller.value ?? palettes[currentPaletteIndex][4];
    currentPaletteIndex =
        palettes.indexWhere((palette) => palette.contains(selectedColor));
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
    setState(() {
      selectedColor =
          widget._controller.value ?? palettes[currentPaletteIndex][4];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: palettes.length,
          itemBuilder: (context, index) {
            return _buildBox(
              color: palettes[index][4],
              checked: palettes[index][4] == selectedColor,
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
          itemCount: palettes[currentPaletteIndex].length,
          itemBuilder: (context, index) {
            return _buildBox(
              color: palettes[currentPaletteIndex][index],
              checked: palettes[currentPaletteIndex][index] == selectedColor,
              onTap: (Color color) {
                setState(() {
                  selectedColor = color;
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
