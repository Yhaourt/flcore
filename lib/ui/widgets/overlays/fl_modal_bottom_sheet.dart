import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';

showFlModalBottomSheet(
  BuildContext context, {
  required Widget child,
  String? title,
  String? subtitle,
  double? maxHeight,
}) {
  showModalBottomSheet(
    context: context,
    builder: (context) => FlModalBottomSheet(
      title: title,
      subtitle: subtitle,
      maxHeight: maxHeight,
      child: child,
    ),
    isScrollControlled: true,
  );
}

class FlModalBottomSheet extends StatelessWidget {
  const FlModalBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.maxHeight,
  });

  final Widget child;
  final String? title;
  final String? subtitle;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.85,
      ),
      padding: EdgeInsets.only(
        top: FlTheme.spacingMd,
        bottom: MediaQuery.of(context).viewInsets.bottom + FlTheme.paddingMd,
        left: FlTheme.spacingMd,
        right: FlTheme.spacingMd,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(FlTheme.borderRadiusMd),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 7,
              width: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(FlTheme.borderRadiusMd),
              ),
            ),
          ),
          SizedBox(height: FlTheme.spacingLg),
          if (title != null) ...[
            Text(
              title!,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            if (subtitle != null)
              Text(
                subtitle!,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            SizedBox(height: FlTheme.spacingLg),
          ],
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(FlTheme.paddingMd),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
