import 'package:admin_jandhara/core/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../constants/value_constants.dart';
import '../helper_ui.dart';

class CustomNetworkImageView extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double? dBorderRadius;
  final bool? onlyTop;
  final bool? onlyBottom;
  final ImageShapes shape;
  final VoidCallback clickAction;
  final Widget? errorWidget;
  final String? placeholder;
  const CustomNetworkImageView(
      {Key? key,
      required this.imagePath,
      this.height,
      this.width,
      this.onlyTop = false,
      this.onlyBottom = false,
      this.shape = ImageShapes.Standard, // Default
      this.dBorderRadius,
      this.clickAction = _defaultFunction,
      this.fit = BoxFit.contain,
      this.placeholder = DEFAULT_PROFILE,
      this.errorWidget})
      : super(key: key);

  factory CustomNetworkImageView.square(
      {required String imagePath,
      double? height,
      double? width,
      BoxFit? fit,
      bool? onlyTop = false,
      bool? onlyBottom = false,
      final String? placeholder,
      final double? dBorderRadius,
      VoidCallback clickAction = _defaultFunction}) {
    return CustomNetworkImageView(
        imagePath: imagePath,
        shape: ImageShapes.Square,
        dBorderRadius: dBorderRadius,
        height: height,
        width: width,
        placeholder: placeholder,
        fit: fit,
        onlyBottom: onlyBottom,
        onlyTop: onlyTop,
        clickAction: clickAction);
  }

  factory CustomNetworkImageView.circle(
      {required String imagePath,
      double? height,
      double? width,
      BoxFit? fit,
      bool? onlyTop = false,
      bool? onlyBottom = false,
      final String? placeholder,
      final double? dBorderRadius,
      VoidCallback clickAction = _defaultFunction}) {
    return CustomNetworkImageView(
        imagePath: imagePath,
        shape: ImageShapes.Standard,
        dBorderRadius: dBorderRadius,
        height: height,
        width: width,
        onlyBottom: onlyBottom,
        onlyTop: onlyTop,
        placeholder: placeholder,
        fit: fit,
        clickAction: clickAction);
  }

  static _defaultFunction() {
    // Does nothing
  }
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: onlyBottom! || onlyTop!
          ? BorderRadius.vertical(
              top: Radius.circular(
                  !onlyTop! ? 0.0 : dBorderRadius ?? VALUE_INPUT_BORDER_RADIUS),
              bottom: Radius.circular(!onlyBottom!
                  ? 0.0
                  : dBorderRadius ?? VALUE_INPUT_BORDER_RADIUS),
            )
          : BorderRadius.circular(dBorderRadius ?? VALUE_INPUT_BORDER_RADIUS),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: CachedNetworkImage(
        imageUrl: imagePath,
        height: height,
        width: width,
        fit: fit,
        placeholder: (context, url) => Container(
            child: HelperUI.getProgressGhost(height: height, width: width)),
        errorWidget: (context, _, s) =>
            errorWidget ??
            Image.asset(
              placeholder ?? DEFAULT_PROFILE,
              fit: fit,
            ),
      ),
    );
  }
}
