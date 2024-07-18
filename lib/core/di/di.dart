import 'package:get_it/get_it.dart';

final di = GetIt.instance;

class DependencyInjection {
  static Future<void> init({
    required Function(GetIt) configure,
    required Function(GetIt) finalize,
  }) async {
    configure(di);

    await di.allReady(
      timeout: const Duration(seconds: 5),
    );

    finalize(di);
  }
}
