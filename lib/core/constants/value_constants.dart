// All values used inside the app
//==========================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ImageShapes {
  None,
  Standard, // Corners will not be sharp
  Square, // Sharp corners
}

//==========================================================
// Corner radius
double VALUE_STANDARD_BUTTON_CORNER_RADIUS = 24.r;
double SEARCHBAR_CORNER_RADIUS = 40.r;
double VALUE_AVATAR_ICON_CORNER_RADIUS = 20.r;
double HEADER_CARD_BORDER_RADIUS = 12.r;
const double VALUE_TABBAR_BORDER_RADIUS = 0;
double VALUE_ICONTITLESUBTITLE_BORDER_RADIUS = 10.r;
double VALUE_INPUT_BORDER_RADIUS = 8.0.r;
double SMALL_BORDER_RADIUS = 4.0.r;
//==========================================================
// Elevations
const double HEADER_CARD_ELEVATION = 0.0;
//==========================================================
// Height
double VALUE_TAB_BAR_HEIGHT = kToolbarHeight;
double OPENED_DROPDOWN_ITEM_PADDING = 12.0.h;
//==========================================================
// Width
const double VALUE_TAB_BAR_LINE_WIDTH = 3;
//==========================================================
const String CURRENCY = "₹";
// box-shadow
BOXSHADOW(
        {double? dx,
        double? dy,
        double? sRadius,
        double? bRadius,
        Color? color}) =>
    BoxShadow(
        offset: Offset(dx ?? 0, dy ?? 6),
        blurRadius: bRadius ?? 8,
        spreadRadius: sRadius ?? 0.0,
        color: color ?? const Color.fromRGBO(0, 0, 0, 0.1));

int countValue = 0;
