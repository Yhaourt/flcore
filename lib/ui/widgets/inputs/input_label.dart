import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  const InputLabel({
    super.key,
    required this.label,
    this.info,
  });

  final String label;
  final String? info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 3,
      ),
      child: Row(
        children: [
          if (info != null)
            Padding(
              padding: const EdgeInsets.all(3),
              child: Tooltip(
                message: info!,
                child: Icon(
                  Icons.info,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
              ),
            ),
          SizedBox(width: info != null ? FlTheme.spacing : 0),
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
