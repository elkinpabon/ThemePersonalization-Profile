import 'package:flutter/material.dart';

// Icono con avatar personalizado
class AvatarIcon extends StatelessWidget {
  final String? imageUrl;
  final String initials;
  final double radius;
  final Color? backgroundColor;

  const AvatarIcon({
    super.key,
    this.imageUrl,
    required this.initials,
    this.radius = 40,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // Determinar si es una imagen local (asset) o de red (URL)
    final isAsset = imageUrl != null && imageUrl!.startsWith('assets/');
    final isNetwork = imageUrl != null && !isAsset;

    ImageProvider? backgroundImage;
    if (isNetwork) {
      backgroundImage = NetworkImage(imageUrl!);
    } else if (isAsset) {
      backgroundImage = AssetImage(imageUrl!);
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor:
          backgroundColor ?? Theme.of(context).colorScheme.secondary,
      backgroundImage: backgroundImage,
      child: imageUrl == null
          ? Text(
              initials,
              style: TextStyle(
                fontSize: radius * 0.5,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}
