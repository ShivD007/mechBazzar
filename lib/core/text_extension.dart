import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'constants/style_constants.dart';

extension ExtendedString on String {
  Text h25(
          {Color? textColor,
          TextAlign? textAlign = TextAlign.center,
          int? maxLines,
          FontWeight? fontWeight,
          double? fontSize,
          TextOverflow? overflow}) =>
      Text(
        this,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style:  MontserratStyle.h3SemiboldGrey900_25px.copyWith(
                color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      );

  // body with color:grey400 ----- weight: 400
  Text body16(
          {Color? textColor,
          FontWeight? fontWeight,
          double? fontSize,
          TextAlign? textAlign = TextAlign.center,
          int? maxLines,
          double? height,
          TextOverflow? overflow}) =>
      Text(this,
          maxLines: maxLines,
          overflow: overflow,
          textAlign: textAlign,
          style:  Style_OpenSans.bodyRegularGrey400_16px.copyWith(
                  color: textColor,
                  fontSize: fontSize,
                  height: height,
                  fontWeight: fontWeight));

  Text body14(
          {Color? textColor,
          FontWeight? fontWeight,
          double? fontSize,
          TextAlign? textAlign = TextAlign.center,
          int? maxLines,
          TextDecoration? decoration,
          TextOverflow? overflow}) =>
      Text(this,
          maxLines: maxLines,
          overflow: overflow,
          textAlign: textAlign,
          style:  Style_OpenSans.bodySemiBoldGrey900_14px.copyWith(
                  color: textColor,
                  fontSize: fontSize,
                  decoration: decoration,
                  fontWeight: fontWeight));

}
