import 'package:flcore/core/routing/fl_router.dart';
import 'package:flcore/ui/theme/fl_theme.dart';
import 'package:flutter/material.dart';

class FlApp extends StatelessWidget {
  const FlApp({
    super.key,
    required this.title,
    required this.router,
    required this.theme,
    this.builder,
  });

  final String title;
  final FlRouter router;
  final FlTheme theme;
  final Widget Function(BuildContext, Widget?)? builder;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: title,
      restorationScopeId: '${title.toLowerCase()}-app',
      themeMode: ThemeMode.light,
      theme: theme.lightTheme(),
      darkTheme: theme.darkTheme(),
      routerConfig: router.router,
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) {
                return GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: builder?.call(context, child) ?? child,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
