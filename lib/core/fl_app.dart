import 'package:flcore/core/routing/fl_router.dart';
import 'package:flcore/ui/theme/fl_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlApp extends StatelessWidget {
  const FlApp({
    super.key,
    required this.title,
    required this.router,
    this.theme = const FlTheme(),
    this.providers = const <BlocProvider>[],
  });

  final String title;
  final FlRouter router;
  final FlTheme theme;
  final List<BlocProvider> providers;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: MaterialApp.router(
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
                    onPanDown: (_) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    child: child!,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
