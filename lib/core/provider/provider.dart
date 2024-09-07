import 'dart:async';

/// A class that provides a stream of data.
abstract class Provider<T> {
  Provider({
    this.source,
    this.asyncSource,
    this.onDataChanged,
  }) {
    if (source == null && asyncSource == null) {
      throw Exception('source or asyncSource must be provided');
    }
    if (source != null && asyncSource != null) {
      throw Exception(
          'source and asyncSource cannot be provided at the same time');
    }
    _streamController = StreamController<T>.broadcast(
      onListen: () => (_loaded) ? broadcast(data) : load(),
    );
  }

  /// Function that provides the initial data.
  final T Function()? source;

  /// Function that asynchronously provides the initial data.
  final Future<T> Function()? asyncSource;

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
      if (source != null) {
        broadcast(source!());
      } else if (asyncSource != null) {
        broadcast(await asyncSource!());
      }
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

  /// Broadcasts an error.
  void broadcastError(Object error) {
    _streamController.addError(error);
  }

  /// Resets the provider.
  void reset() {
    _loaded = false;
    _data = null;
  }

  /// Disposes the stream.
  void dispose() {
    _streamController.close();
  }
}
