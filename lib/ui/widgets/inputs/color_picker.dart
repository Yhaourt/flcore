import 'package:flcore/ui/theme/fl_theme.dart';
import 'package:flcore/utils/helpers/color_helper.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    required this.onColorPicked,
    this.currentColor,
  });

  final void Function(Color) onColorPicked;
  final Color? currentColor;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  final List<List<Color>> palettes = colorPalettes();
  int currentPaletteIndex = 0;
  Color selectedColor = Colors.transparent;

  @override
  void initState() {
    setState(() {
      selectedColor = widget.currentColor ?? palettes[currentPaletteIndex][4];
      currentPaletteIndex =
          palettes.indexWhere((palette) => palette.contains(selectedColor));
    });
    super.initState();
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
              onTap: widget.onColorPicked,
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
    Function(Color)? onTap,
    bool checked = false,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
        if (onTap != null) {
          onTap(color);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(FlTheme.borderRadius),
          color: color,
        ),
        child: (checked)
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
