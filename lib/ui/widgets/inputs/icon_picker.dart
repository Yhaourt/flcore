import 'package:flcore/ui/widgets/inputs/dots_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flcore/flcore.dart';

class IconPicker extends StatefulWidget {
  IconPicker({
    super.key,
    final List<IconData> icons = const [],
    final List<List<IconData>> packs = const [],
    final IconData? defaultIcon,
    required this.onIconPicked,
  }) {
    _pickerIcons = [...icons, ...packs.expand((element) => element)];
    _defaultIcon = defaultIcon ?? _pickerIcons.first;
  }

  late final List<IconData> _pickerIcons;
  late final IconData? _defaultIcon;
  final void Function(IconData) onIconPicked;

  @override
  State<IconPicker> createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
  Map<String, int> map = {};
  List<IconData> filteredIcons = [];
  IconData? selectedIcon;

  @override
  void initState() {
    setState(() {
      selectedIcon = widget._defaultIcon;
      filteredIcons = widget._pickerIcons.take(30).toList();
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
            const SizedBox(width: FlTheme.spacing),
            Expanded(
              child: SearchInput(
                hintText: 'Rechercher ...',
                onChanged: (value) {
                  setState(() {
                    filteredIcons = widget._pickerIcons
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
        const SizedBox(height: FlTheme.spacing),
        Container(
          padding: const EdgeInsets.all(FlTheme.padding),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(FlTheme.borderRadius),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredIcons.length,
                itemBuilder: (context, index) {
                  return _buildIcon(filteredIcons[index]);
                },
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 40,
                  childAspectRatio: 1,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
              ),
              const SizedBox(height: FlTheme.spacing),
              DotsPagination(
                pageCount: (widget._pickerIcons.length / 30).ceil(),
                onPageChange: (index) {
                  setState(() {
                    filteredIcons =
                        widget._pickerIcons.skip(index * 30).take(30).toList();
                  });
                },
              ),
            ],
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
