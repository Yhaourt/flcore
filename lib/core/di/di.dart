import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

/// A class that provides dependency injection capabilities.
class DependencyInjection {
  DependencyInjection({
    bool loadEnv = false,
    String envFile = '.env',
  }) {
    if (loadEnv) _loadEnv(envFile);
  }

  final Completer<void> _envLoaded = Completer<void>();

  final _di = GetIt.instance;
  late final Map<String, String>? _env;

  /// Get an instance of a registered dependency.
  T call<T extends Object>() => _di<T>();

  Future<void> _loadEnv(String fileName) async {
    await dotenv.load(fileName: fileName);
    _env = dotenv.env;
    _envLoaded.complete();
  }

  /// Initialize the dependency injection container.
  Future<void> initialize(
    /// Function to configure the dependency injection container.
    Function(GetIt container, Map<String, String> env) configure, {
    /// Function which is called after all dependencies are ready.
    Function(GetIt container, Map<String, String> env)? finalize,
  }) async {
    await _envLoaded.future;

    configure(_di, _env ?? {});

    await _di.allReady(
      timeout: const Duration(seconds: 5),
    );

    finalize?.call(_di, _env ?? {});
  }

  /// Alter the dependency injection container.
  Future<void> alter(
    /// Function to alter the dependency injection container.
    Function(GetIt, Map<String, String> env) alter,
  ) async {
    alter(_di, _env ?? {});
  }
}
