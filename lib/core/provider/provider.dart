// import 'dart:async';
//
// abstract class Provider<T> {
//   Provider() {
//     _streamController = StreamController<T>.broadcast(
//       onListen: () async => broadcast(_data),
//     );
//   }
//
//   T _data = null as T;
//
//   late final StreamController<T> _streamController;
//
//   Stream<T> get stream => _streamController.stream;
//
//   void broadcast(T data) {
//     _data = data;
//     _streamController.add(data);
//   }
// }
