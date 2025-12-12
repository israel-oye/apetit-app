import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MealImage extends StatelessWidget {
  const MealImage({super.key, required this.imageUrl, this.imageHeight = 200});

  final String imageUrl;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fit: BoxFit.cover,
      width: double.infinity,
      height: imageHeight,
      placeholder: MemoryImage(kTransparentImage),
      image: NetworkImage(imageUrl),
      imageErrorBuilder: (ctx, error, stackTrace) {
        return SizedBox(
          width: double.infinity,
          height: imageHeight,
          child: Container(
            color: const Color.fromARGB(157, 238, 238, 238),
            child: Icon(
              Icons.image_not_supported,
              size: 50,
              color: Colors.grey[400],
            ),
          ),
        );
      },
    );
  }
}
