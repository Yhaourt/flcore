import 'package:flutter/material.dart';

extension StringExtension on String {
  Color toColor() {
    return Color(int.parse(this.substring(1, 7), radix: 16) + 0xFF000000);
  }
}

extension ColorExtension on Color {
  String toHex() {
    return '#${(value & 0xFFFFFF).toRadixString(16).padLeft(6, '0')}';
  }
}