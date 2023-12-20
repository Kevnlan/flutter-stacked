import 'package:flutter/material.dart';
import 'package:flutter_application_stacked/models/pixabay_images.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, required this.image});

  final PixabayImages image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 200,
      margin: const EdgeInsets.all(5),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image.largeImageUrl),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
