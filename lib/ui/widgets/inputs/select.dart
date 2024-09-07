import 'package:flutter/material.dart';
import 'package:flcore/flcore.dart';

enum SelectStyle { classic, noBorder }

class Select<T> extends StatefulWidget {
  const Select({
    super.key,
    required this.controller,
    this.onSelected,
    this.pairs = const [],
    this.placeholder,
    this.isResettable = false,
    this.selectStyle = SelectStyle.classic,
  });

  final SelectController<T> controller;
  final void Function(T?)? onSelected;
  final List<Pair<T>> pairs;
  final String? placeholder;
  final bool isResettable;
  final SelectStyle selectStyle;

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
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceContainer,
            border: _buildInputBorder(
                context, Theme.of(context).colorScheme.primary),
            enabledBorder: _buildInputBorder(
                context, Theme.of(context).colorScheme.primary),
            focusedBorder: _buildInputBorder(
                context, Theme.of(context).colorScheme.primary),
            errorBorder:
                _buildInputBorder(context, Theme.of(context).colorScheme.error),
            focusedErrorBorder:
                _buildInputBorder(context, Theme.of(context).colorScheme.error),
            errorStyle: const TextStyle(fontSize: 0),
          ),
        );
      },
    );
  }

  OutlineInputBorder _buildInputBorder(BuildContext context, Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(FlTheme.borderRadiusMd),
      borderSide: (widget.selectStyle == SelectStyle.noBorder)
          ? BorderSide.none
          : BorderSide(
              color: color,
              width: 2,
            ),
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
