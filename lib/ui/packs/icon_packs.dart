import 'package:flutter/material.dart';

class IconPack {
  IconPack({
    required this.icons,
  });

  final Map<String, IconData> icons;
}

class IconPacks {
  static final IconPack simplePack = IconPack(
    icons: {
      // Home and Furniture
      'home': Icons.home,
      'weekend': Icons.weekend,
      'kitchen': Icons.kitchen,
      'chair': Icons.chair,
      'bed': Icons.bed,

      // Electronics
      'smartphone': Icons.smartphone,
      'laptop': Icons.laptop,
      'tv': Icons.tv,
      'camera_alt': Icons.camera_alt,
      'headphones': Icons.headphones,
      'watch': Icons.watch,
      'computer': Icons.computer,
      'print': Icons.print,
      'scanner': Icons.scanner,

      // Shopping
      'shopping_bag': Icons.shopping_bag,
      'checkroom': Icons.checkroom,
      'local_grocery_store': Icons.local_grocery_store,

      // Food and Drink
      'restaurant_menu': Icons.restaurant_menu,
      'local_pizza': Icons.local_pizza,
      'fastfood': Icons.fastfood,
      'local_cafe': Icons.local_cafe,

      // Health and Wellness
      'local_pharmacy': Icons.local_pharmacy,
      'spa': Icons.spa,
      'face': Icons.face,
      'fitness_center': Icons.fitness_center,
      'health_and_safety': Icons.health_and_safety,

      // Sports and Recreation
      'sports_soccer': Icons.sports_soccer,
      'directions_bike': Icons.directions_bike,
      'hiking': Icons.hiking,
      'pool': Icons.pool,
      'surfing': Icons.surfing,
      'toys': Icons.toys,
      'sports_esports': Icons.sports_esports,
      'videogame_asset': Icons.videogame_asset,
      'child_friendly': Icons.child_friendly,

      // Books and Media
      'menu_book': Icons.menu_book,
      'library_books': Icons.library_books,
      'movie': Icons.movie,
      'music_note': Icons.music_note,

      // Travel and Transport
      'directions_car': Icons.directions_car,
      'local_gas_station': Icons.local_gas_station,
      'speed': Icons.speed,
      'work': Icons.work,
      'luggage': Icons.luggage,
      'flight': Icons.flight,
      'hotel': Icons.hotel,
      'beach_access': Icons.beach_access,

      // City and Nature
      'location_city': Icons.location_city,
      'pets': Icons.pets,
      'local_florist': Icons.local_florist,
      'ac_unit': Icons.ac_unit,
      'nature': Icons.nature,
      'grass': Icons.grass,
      'sunny': Icons.sunny,
      'bedtime': Icons.bedtime,

      // Additions
      'local_bar': Icons.local_bar,
      'local_parking': Icons.local_parking,
      'local_shipping': Icons.local_shipping,
      'local_taxi': Icons.local_taxi,
      'local_library': Icons.local_library,
      'local_dining': Icons.local_dining,
      'local_drink': Icons.local_drink,
      'local_convenience_store': Icons.local_convenience_store,
    },
  );
}
