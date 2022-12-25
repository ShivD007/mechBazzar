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
        style: textColor == null
            ? MontserratStyle.h3SemiboldGrey900_25px
            : MontserratStyle.h3SemiboldGrey900_25px.copyWith(
                color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      );

  Text h16BoldOpenSans(Color textColor) => Text(
        this,
        style: Style_OpenSans.style16BOLD(textColor),
      );
  Text h10BoldOpenSans(Color textColor) => Text(
        this,
        style: Style_OpenSans.style10BOLD(textColor),
      );

  h16BoldOpenSansQuiz(Color textColor, TextAlign textAlign) => Text(
        this,
        textAlign: textAlign,
        style: Style_OpenSans.style16BOLD(textColor),
      );

  Text label12(
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
        style: textColor == null
            ? Style_OpenSans.labelRegularGrey400_12px
            : Style_OpenSans.labelRegularGrey400_12px.copyWith(
                color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      );

  Text label14(
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
        style: textColor == null
            ? Style_OpenSans.labelRegularGrey400_14px
            : Style_OpenSans.labelRegularGrey400_14px.copyWith(
                color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      );

  Text label10(
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
        style: textColor == null
            ? Style_OpenSans.labelSemiBoldGrey600_10px
            : Style_OpenSans.labelSemiBoldGrey600_10px.copyWith(
                color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      );

  Text subtitle20(
          {Color? textColor,
          FontWeight? fontWeight,
          double? fontSize,
          TextAlign? textAlign = TextAlign.center,
          int? maxLines,
          TextOverflow? overflow}) =>
      Text(
        this,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: textColor == null
            ? Style_OpenSans.subtitleSemiboldGrey600_20px
            : Style_OpenSans.subtitleSemiboldGrey600_20px.copyWith(
                color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      );

  Text smallButton14() => Text(
        this,
        style: Style_OpenSans.style16BOLD600(AppColors.COLOR_WHITE),
      );

  Text openSansGeneralStyle(
          {FontWeight fontWeight = FontWeight.normal,
          Color textColor = AppColors.COLOR_BLACK,
          double fontSize = 16,
          FontStyle fontStyle = FontStyle.normal,
          TextDecoration decoration = TextDecoration.none}) =>
      Text(
        this,
        style: Style_OpenSans.generalStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            textColor: textColor,
            fontStyle: fontStyle,
            decoration: decoration),
      );

  Text openSans12(Color textColor) => Text(
        this,
        style: Style_OpenSans.style12Normal(textColor),
      );

  Text openSans14(Color textColor) => Text(
        this,
        style: Style_OpenSans.style14BOLD600(textColor),
      );

  Text overline16(
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
        style: textColor == null
            ? Style_OpenSans.overlineSemiboldGrey500_16px
            : Style_OpenSans.overlineSemiboldGrey500_16px.copyWith(
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
          style: textColor == null
              ? Style_OpenSans.bodyRegularGrey400_16px
              : Style_OpenSans.bodyRegularGrey400_16px.copyWith(
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
          TextOverflow? overflow}) =>
      Text(this,
          maxLines: maxLines,
          overflow: overflow,
          textAlign: textAlign,
          style: textColor == null
              ? Style_OpenSans.bodySemiBoldGrey900_14px
              : Style_OpenSans.bodySemiBoldGrey900_14px.copyWith(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight));

  Text caption(
          {Color? textColor,
          TextAlign? textAlign = TextAlign.center,
          int? maxLines,
          FontWeight? fontWeight,
          double? fontSize,
          TextOverflow? overflow}) =>
      Text(this,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: textColor == null
              ? Style_OpenSans.captionSemiboldGrey900_12px
              : Style_OpenSans.captionSemiboldGrey900_12px.copyWith(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight));

  Text lato14(
          {Color? textColor,
          TextAlign? textAlign = TextAlign.center,
          int? maxLines,
          FontWeight? fontWeight,
          double? fontSize,
          TextOverflow? overflow}) =>
      Text(this,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: textColor == null
              ? Styles_Lato.latoRegularGrey800_14px
              : Styles_Lato.latoRegularGrey800_14px.copyWith(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight));
}
