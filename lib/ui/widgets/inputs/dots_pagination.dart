import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';

class DotsPagination extends StatefulWidget {
  const DotsPagination({
    super.key,
    required this.pageCount,
    required this.onPageChange,
  });

  final int pageCount;
  final void Function(int) onPageChange;

  @override
  State<DotsPagination> createState() => _DotsPaginationState();
}

class _DotsPaginationState extends State<DotsPagination> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanEnd: (details) {
        final delta = details.velocity.pixelsPerSecond.dx;
        if (delta != 0) {
          setState(() {
            currentPage += delta < 0 ? 1 : -1;
            currentPage = currentPage.clamp(0, widget.pageCount - 1);
            widget.onPageChange(currentPage);
          });
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.pageCount,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                currentPage = index;
                widget.onPageChange(index);
              });
            },
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(
                horizontal: FlTheme.paddingMd,
                vertical: FlTheme.paddingSm,
              ),
              child: CircleAvatar(
                radius: 5,
                backgroundColor: index == currentPage
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
