import 'package:go_router/go_router.dart';

class FlRouter {
  FlRouter({
    required String initialLocation,
    required List<RouteBase> routes,
    debug = false,
  }) {
    router = GoRouter(
      debugLogDiagnostics: debug,
      initialLocation: initialLocation,
      routes: routes,
    );
  }

  late final GoRouter router;
}
