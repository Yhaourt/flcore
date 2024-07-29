import 'dart:math';

int generateUniqueId() {
  return DateTime.now().millisecondsSinceEpoch + Random().nextInt(1 << 20);
}
