import 'dart:async';

/// A class that provides a stream of data.
abstract class Provider<T> {
  Provider({
    required this.fetch,
  }) {
    _streamController = StreamController<T>.broadcast(
      onListen: () => (_loaded) ? broadcast(data) : load(),
    );
  }

  /// Function that fetches the data.
  final Future<T> Function() fetch;

  bool _loaded = false;

  T? _data;

  /// Current data.
  /// Throws an exception if the provider is not loaded yet.
  T get data {
    if (!_loaded) throw Exception('Provider not loaded yet');
    return _data!;
  }

  late final StreamController<T> _streamController;

  /// Stream of data.
  Stream<T> get stream => _streamController.stream;

  /// Loads the data and broadcasts it.
  Future<void> load() async {
    try {
      broadcast(await fetch());
      _loaded = true;
    } catch (e) {
      _streamController.addError(e);
    }
  }

  /// Broadcasts the data.
  void broadcast(T data) {
    _data = data;
    _streamController.add(data);
  }

  /// Disposes the stream.
  void dispose() {
    _streamController.close();
  }
}
