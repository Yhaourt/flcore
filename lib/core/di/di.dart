import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

class DependencyInjection {
  static Future<void> init({
    required Function(GetIt, Map<String, String> env) configure,
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
}
