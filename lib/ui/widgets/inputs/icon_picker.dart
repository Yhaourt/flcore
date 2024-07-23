import 'package:flcore/ui/widgets/inputs/dots_pagination.dart';
import 'package:flcore/ui/widgets/inputs/icon_packs.dart';
import 'package:flutter/material.dart';
import 'package:flcore/flcore.dart';

class IconPicker extends StatefulWidget {
  IconPicker({
    super.key,
    final IconPickerController? controller,
    required final List<IconPack> packs,
    final IconData? defaultIcon,
    required this.onIconPicked,
  }) {
    assert(packs.isNotEmpty);
    _controller = controller ?? IconPickerController();
    _iconMap = {for (var pack in packs) ...pack.pack};
    _pickerIcons = _iconMap.values.toSet().toList();
    _defaultIcon = defaultIcon ?? _pickerIcons.first;
  }

  late final IconPickerController _controller;
  late final List<IconData> _pickerIcons;
  late final Map<String, IconData> _iconMap;
  late final IconData? _defaultIcon;
  final void Function(IconData) onIconPicked;

  @override
  State<IconPicker> createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
  List<IconData> filteredIcons = [];
  late IconData selectedIcon;

  @override
  void initState() {
    super.initState();
    selectedIcon = (widget._controller.value ?? widget._defaultIcon)!;
    filteredIcons = widget._pickerIcons.take(30).toList();
    widget._controller.addListener(_updateState);
  }

  @override
  void didUpdateWidget(covariant IconPicker oldWidget) {
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
      selectedIcon = (widget._controller.value ?? widget._defaultIcon)!;
    });
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
                        .where((icon) {
                          final iconName = widget._iconMap.keys.firstWhere(
                              (name) => widget._iconMap[name] == icon,
                              orElse: () => '');
                          return iconName
                              .toLowerCase()
                              .contains(value.toLowerCase());
                        })
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
          widget._controller.value = icon;
          widget.onIconPicked(icon);
        });
      },
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}

class IconPickerController extends ValueNotifier<IconData?> {
  IconPickerController({IconData? value}) : super(value);
}
