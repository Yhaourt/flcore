import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FlRoute {
  FlRoute({
    required this.name,
    required this.path,
    required this.builder,
  });

  final String name;
  final String path;
  final Widget Function(BuildContext, GoRouterState) builder;
}
