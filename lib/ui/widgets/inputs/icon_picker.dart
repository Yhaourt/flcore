import 'package:flcore/flcore.dart';
import 'package:flcore/ui/theme/fl_theme.dart';
import 'package:flcore/ui/widgets/inputs/search_input.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IconPicker extends StatefulWidget {
  const IconPicker({
    super.key,
    required this.icons,
    required this.defaultIcon,
    required this.onIconPicked,
    this.currentIcon,
  });

  final List<IconData> icons;
  final IconData defaultIcon;
  final void Function(IconData) onIconPicked;
  final IconData? currentIcon;

  @override
  State<IconPicker> createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
  Map<String, int> map = {};
  List<IconData>? filteredIcons;
  IconData? selectedIcon;

  @override
  void initState() {
    setState(() {
      selectedIcon = widget.currentIcon ?? widget.defaultIcon;
      filteredIcons = widget.icons.take(30).toList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(FlTheme.borderRadius),
              ),
              child: Center(
                child: Icon(
                  selectedIcon,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            SizedBox(width: FlTheme.spacing),
            Expanded(
              child: SearchInput(
                hintText: 'Rechercher ...',
                onChanged: (value) {
                  setState(() {
                    filteredIcons = widget.icons
                        .where((icon) => map.entries.any((entry) =>
                            entry.key.contains(value.toLowerCase()) &&
                            entry.value == icon.codePoint))
                        .take(30)
                        .toList();
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(height: FlTheme.spacing),
        Container(
          padding: EdgeInsets.all(FlTheme.padding),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(FlTheme.borderRadius),
          ),
          child: filteredIcons == null
              ? const Center(
                  child: Loader(
                    size: LoaderSize.sm,
                  ),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredIcons!.length,
                  itemBuilder: (context, index) {
                    return _buildIcon(filteredIcons![index]);
                  },
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 40,
                    childAspectRatio: 1,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildIcon(IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIcon = icon;
        });
        widget.onIconPicked(icon);
      },
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
