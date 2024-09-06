import 'dart:async';

abstract class Provider<T> {
  Provider({
    required this.load,
    bool broadcastOnListen = true,
  }) {
    _streamController = StreamController<T>.broadcast(
      onListen: () => (broadcastOnListen)
          ? (loaded)
              ? broadcast(data)
              : _loadAndBroadcast()
          : null,
    );
  }

  final Future<T> Function() load;

  bool loaded = false;

  T? _data;

  T get data {
    if (!loaded) throw Exception('Provider not loaded yet');
    return _data!;
  }

  late final StreamController<T> _streamController;

  Stream<T> get stream => _streamController.stream;

  Future<void> _loadAndBroadcast() async {
    try {
      broadcast(await load());
      loaded = true;
    } catch (e) {
      _streamController.addError(e);
    }
  }

  void broadcast(T data) {
    _data = data;
    _streamController.add(data);
  }

  void dispose() {
    _streamController.close();
  }
}
