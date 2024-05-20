import 'package:flutter/widgets.dart';

import '../constants/color_constants.dart';
import '../constants/constants.dart';

class AppTextStyles {
  AppTextStyles._();

  static const loginFontsStyle = TextStyle(
      fontFamily: kFontFamily,
      color: kDarkBrownColor,
      fontWeight: FontWeight.bold,
      fontSize: 30,
      letterSpacing: 1.5);

  static const light = TextStyle(
    fontFamily: kFontFamily,
    color: kDarkBrownColor,
    fontWeight: FontWeight.w300,
  );

  static const normal = TextStyle(
    fontFamily: kFontFamily,
    color: kDarkBrownColor,
    fontWeight: FontWeight.w400,
  );

  static const medium = TextStyle(
    fontFamily: kFontFamily,
    color: kSecondaryColor,
    fontWeight: FontWeight.w500,
  );

  static const semiBold = TextStyle(
      fontFamily: kFontFamily,
      color: kSecondaryColor,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      letterSpacing: 0.5);

  static const bold = TextStyle(
    fontFamily: kFontFamily,
    color: kDarkBrownColor,
    fontWeight: FontWeight.w700,
  );

  static const black = TextStyle(
    fontFamily: kFontFamily,
    color: kDarkBrownColor,
    fontWeight: FontWeight.w900,
  );

  static const hintTextStyle = TextStyle(
      fontFamily: kFontFamily,
      color: kSecondaryColor,
      fontWeight: FontWeight.w500,
      fontSize: 12);
}
