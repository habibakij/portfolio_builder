import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

TextStyle normalTextStyle({
  color = AppColors.textColor,
  decorationColor = AppColors.textColor,
  double fontSize = 12,
  isShadowRequired = false,
  fontWeight = FontWeight.normal,
  double? height,
  TextDecoration? decoration,
}) {
  return GoogleFonts.inter(
    shadows:
        isShadowRequired
            ? [
              Shadow(
                color: AppColors.black.withValues(alpha: 0.3),
                offset: const Offset(15, 15),
                blurRadius: 15,
              ),
            ]
            : [],
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: decoration,
    height: height,
    decorationColor: decorationColor,
  );
}

TextStyle titleTextStyle({
  color = AppColors.textColor,
  decorationColor = AppColors.textColor,
  double fontSize = 20,
  fontWeight = FontWeight.w700,
  double? height,
  TextDecoration? decoration,
}) {
  return GoogleFonts.inter(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: decoration,
    height: height,
    decorationColor: decorationColor,
  );
}
