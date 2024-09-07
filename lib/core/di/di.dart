import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final DependencyInjection CONTAINER = DependencyInjection();

class DependencyInjection {
  DependencyInjection({
    bool loadEnv = false,
    String envFile = '.env',
  }) {
    if (loadEnv) dotenv.load(fileName: envFile);
  }

  final di = GetIt.instance;
  late final Map<String, String>? env;

  /// Get an instance of a registered dependency.
  T call<T>() => di<T>();

  Future<void> initialize({
    /// Function to configure the dependency injection container.
    required Function(GetIt, Map<String, String> env) configure,

    /// Function which is called after all dependencies are ready.
    Function(GetIt, Map<String, String>)? finalize,
    bool loadEnv = false,
    String envFile = '.env',
  }) async {
    if (loadEnv) await dotenv.load(fileName: envFile);
    configure(di, dotenv.env);

    await di.allReady(
      timeout: const Duration(seconds: 5),
    );

    if (finalize != null) finalize(di, dotenv.env);
  }

  Future<void> alter({
    /// Function to alter the dependency injection container.
    required Function(GetIt, Map<String, String> env) alter,
  }) async {
    alter(di, dotenv.env);
  }
}
