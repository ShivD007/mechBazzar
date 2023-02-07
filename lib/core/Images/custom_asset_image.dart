import 'package:flutter/material.dart';

import '../constants/value_constants.dart';

class CustomAssetImageView extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double? dBorderRadius;
  final ImageShapes shape;
  final VoidCallback clickAction;
  const CustomAssetImageView(
      {Key? key,
      required this.imagePath,
      this.height,
      this.width,
      this.shape = ImageShapes.Standard, // Default
      this.dBorderRadius,
      this.clickAction = _defaultFunction,
      this.fit = BoxFit.contain})
      : super(key: key);

  factory CustomAssetImageView.square(
      {required String imagePath,
      double? height,
      double? width,
      BoxFit? fit,
      VoidCallback clickAction = _defaultFunction}) {
    return CustomAssetImageView(
        imagePath: imagePath,
        shape: ImageShapes.Square,
        dBorderRadius: 0,
        fit: fit,
        clickAction: clickAction);
  }
  static _defaultFunction() {
    // Does nothing
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickAction,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(dBorderRadius ?? 0.0),
        child: Image.asset(
          imagePath,
          height: height,
          width: width,
          fit: fit,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return const Icon(Icons.error);
          },
        ),
      ),
    );
  }
}
