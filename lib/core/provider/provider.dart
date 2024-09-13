import 'dart:async';

import 'package:rxdart/rxdart.dart';

/// A class that provides a stream of data.
abstract class Provider<T> {
  Provider({
    this.source,
    this.asyncSource,
    this.onListen,
    this.onDataChanged,
    bool broadcastOnListen = true,
  }) {
    if (source == null && asyncSource == null) {
      throw Exception('source or asyncSource must be provided');
    }
    if (source != null && asyncSource != null) {
      throw Exception(
          'source and asyncSource cannot be provided at the same time');
    }

    _subject = BehaviorSubject<T>(onListen: () {
      onListen?.call();

      if (broadcastOnListen) {
        if (_loaded)
          broadcast(data);
        else
          load();
      }
    });
  }

  /// Function that provides the initial data.
  final T Function()? source;

  /// Function that asynchronously provides the initial data.
  final Future<T> Function()? asyncSource;

  /// Function that is called when the stream is listened to.
  /// This function is called before the data is broadcasted.
  final void Function()? onListen;

  /// Function that is called when the data changes.
  /// This function is called after the data is broadcasted.
  final void Function(T)? onDataChanged;

  bool _loaded = false;

  /// Whether the provider is loaded.
  bool get loaded => _loaded;

  T? _data;

  /// Current data.
  /// Throws an exception if the provider is not loaded yet.
  T get data {
    if (!_loaded) throw Exception('Provider not loaded yet');
    return _data!;
  }

  late final BehaviorSubject<T> _subject;

  /// Stream of data.
  Stream<T> get stream => _subject.stream;

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
      _subject.addError(e);
    }
  }

  /// Broadcasts the data.
  void broadcast(T data) {
    _data = data;
    _subject.add(data);
    onDataChanged?.call(data);
  }

  /// Broadcasts an error.
  void broadcastError(Object error) {
    _subject.addError(error);
  }

  /// Resets the provider.
  void reset() {
    _loaded = false;
    _data = null;
  }

  /// Disposes the stream.
  void dispose() {
    _subject.close();
  }
}
