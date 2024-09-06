import 'package:flutter/material.dart';

enum AvatarSize { sm, md, lg }

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    this.imageUrl,
    this.size = AvatarSize.md,
  });

  final String? imageUrl;
  final AvatarSize size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: _getSize(),
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
    );
  }

  double _getSize() {
    switch (size) {
      case AvatarSize.sm:
        return 10;
      case AvatarSize.md:
        return 15;
      case AvatarSize.lg:
        return 20;
    }
  }
}
