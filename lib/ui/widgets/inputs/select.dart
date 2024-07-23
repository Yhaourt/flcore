import 'package:flutter/material.dart';
import 'package:flcore/flcore.dart';

class Select<T> extends StatefulWidget {
  const Select({
    super.key,
    required this.controller,
    this.onSelected,
    this.pairs = const [],
    this.placeholder,
    this.isResettable = false,
  });

  final SelectController<T> controller;
  final void Function(T?)? onSelected;
  final List<Pair<T>> pairs;
  final String? placeholder;
  final bool isResettable;

  @override
  State<Select<T>> createState() => _SelectState<T>();
}

class _SelectState<T> extends State<Select<T>> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    widget.controller.addListener(_updateState);
  }

  @override
  void didUpdateWidget(covariant Select<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_updateState);
      widget.controller.addListener(_updateState);
    }
  }

  void _updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<T>> dropdownMenuEntries = widget.pairs
        .map(
          (pair) => DropdownMenuEntry<T>(
            value: pair.value,
            label: pair.label,
          ),
        )
        .toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        return DropdownMenu<T>(
          width: constraints.maxWidth,
          menuHeight: 300,
          controller: _textEditingController,
          dropdownMenuEntries: dropdownMenuEntries,
          initialSelection: widget.controller.value,
          onSelected: (value) {
            widget.controller.value = value;
            widget.onSelected?.call(value as T);
          },
          leadingIcon: (widget.isResettable && widget.controller.value != null)
              ? Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _textEditingController.clear();
                      widget.controller.value = null;
                      widget.onSelected?.call(null);
                    },
                  ),
                )
              : null,
          hintText: widget.placeholder,
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                height: 1.2,
              ),
          inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(FlTheme.borderRadiusSm),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.surface,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(FlTheme.borderRadiusSm),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateState);
    _textEditingController.dispose();
    super.dispose();
  }
}

class Pair<T> {
  Pair({
    required this.label,
    required this.value,
  });

  final String label;
  final T value;
}

class SelectController<T> extends ValueNotifier<T?> {
  SelectController({T? value}) : super(value);
}
