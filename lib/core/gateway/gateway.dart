import 'package:flcore/core/api/api.dart';

abstract class Gateway {
  const Gateway({
    required this.api,
    this.endpoint,
  });

  final Api api;
  final String? endpoint;
}
