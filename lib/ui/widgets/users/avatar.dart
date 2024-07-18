import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    this.imageUrl,
    this.onTap,
  });

  final String? imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 15,
        backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      ),
    );
  }
}
