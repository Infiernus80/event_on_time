import 'package:flutter/material.dart';

class ImagenShow extends StatelessWidget {
  const ImagenShow({
    Key? key,
    required this.width,
    required this.height,
    required this.alignment,
    required this.routeImage,
  }) : super(key: key);

  final double width;
  final double height;
  final String routeImage;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(routeImage),
      width: width,
      height: height,
      alignment: alignment,
    );
  }
}