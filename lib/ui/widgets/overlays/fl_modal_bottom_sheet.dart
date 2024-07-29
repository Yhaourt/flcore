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
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.8,
      ),
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: FlTheme.spacing,
            bottom: MediaQuery.of(context).viewInsets.bottom + FlTheme.padding,
            left: FlTheme.spacing,
            right: FlTheme.spacing,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(FlTheme.borderRadius),
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
                    borderRadius: BorderRadius.circular(FlTheme.borderRadius),
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
              Padding(
                padding: EdgeInsets.all(FlTheme.padding),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
