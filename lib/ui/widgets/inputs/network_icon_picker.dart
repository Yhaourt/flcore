import 'package:flcore/ui/theme/fl_theme.dart';
import 'package:flcore/ui/widgets/inputs/search_input.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// Still in development
class NetworkIconPicker extends StatefulWidget {
  const NetworkIconPicker({
    super.key,
    required this.onIconPicked,
    this.currentIcon,
  });

  final void Function(IconData) onIconPicked;
  final IconData? currentIcon;

  @override
  State<NetworkIconPicker> createState() => _NetworkIconPickerState();
}

class _NetworkIconPickerState extends State<NetworkIconPicker> {
  Map<String, int> map = {};
  List<IconData>? icons;
  List<IconData>? filteredIcons;
  IconData selectedIcon = Icons.category;

  @override
  void initState() {
    fetchIcons();
    setState(() {
      selectedIcon = widget.currentIcon ?? Icons.category;
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
                    filteredIcons = icons
                        ?.where((icon) => map.entries.any((entry) =>
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
              ? const Center(child: CircularProgressIndicator())
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

  Future<void> fetchIcons() async {
    const String endpoint =
        'https://raw.githubusercontent.com/google/material-design-icons/master/font/MaterialIcons-Regular.codepoints';

    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final String responseBody = response.body;
      final List<String> lines =
          responseBody.split('\n').where((line) => line.isNotEmpty).toList();
      final List<IconData> fetchedIcons = lines.map((line) {
        final List<String> parts = line.split(' ');
        final String name = parts[0];
        final String codePoint = parts[1];
        map[name] = int.parse(codePoint, radix: 16);
        final int codePointInt = int.parse(codePoint, radix: 16);
        return IconData(codePointInt, fontFamily: 'MaterialIcons');
      }).toList();

      setState(() {
        icons = fetchedIcons;
        filteredIcons = fetchedIcons.take(30).toList();
      });
    } else {
      throw Exception('Failed to load icons');
    }
  }
}
