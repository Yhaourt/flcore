import 'package:flcore/core/routing/fl_route.dart';
import 'package:go_router/go_router.dart';

class FlRouter {
  FlRouter({
    required String initialLocation,
    required List<FlRoute> routes,
    debug = false,
  }) {
    router = GoRouter(
      debugLogDiagnostics: debug,
      initialLocation: initialLocation,
      routes: routes.map((route) {
        return GoRoute(
          name: route.name,
          path: route.path,
          builder: route.builder,
        );
      }).toList(),
    );
  }

  late final GoRouter router;
}
