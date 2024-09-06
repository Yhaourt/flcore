import 'dart:async';

/// A class that provides a stream of data.
abstract class Provider<T> {
  Provider({
    required this.load,
    bool broadcastOnListen = true,
  }) {
    _streamController = StreamController<T>.broadcast(
      onListen: () => (broadcastOnListen)
          ? (_loaded)
              ? broadcast(data)
              : _loadAndBroadcast()
          : null,
    );
  }

  /// Function that loads the data.
  final Future<T> Function() load;

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

  Future<void> _loadAndBroadcast() async {
    try {
      broadcast(await load());
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
