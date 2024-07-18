import 'package:flutter/material.dart';
import 'package:flcore/ui/theme/app_theme.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({
    super.key,
    this.title,
    this.subtitle,
  });

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppTheme.padding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error,
        borderRadius: BorderRadius.circular(AppTheme.borderRadius),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error,
            color: Theme.of(context).colorScheme.onError,
          ),
          SizedBox(width: AppTheme.spacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? 'Oops, une erreur est survenue.',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onError,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  subtitle ?? 'Veuillez réessayer plus tard.',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onError,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
