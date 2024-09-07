import 'dart:async';

/// A class that provides a stream of data.
abstract class Provider<T> {
  Provider({
    required this.source,
    this.onDataChanged,
  }) {
    _streamController = StreamController<T>.broadcast(
      onListen: () => (_loaded) ? broadcast(data) : load(),
    );
  }

  /// Function that provides the initial data.
  final Future<T> Function() source;

  /// Function that is called when the data changes.
  /// This function is called after the data is broadcasted.
  final void Function(T)? onDataChanged;

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
      broadcast(await source());
      _loaded = true;
    } catch (e) {
      _streamController.addError(e);
    }
  }

  /// Broadcasts the data.
  void broadcast(T data) {
    _data = data;
    _streamController.add(data);
    onDataChanged?.call(data);
  }

  /// Disposes the stream.
  void dispose() {
    _streamController.close();
  }
}
