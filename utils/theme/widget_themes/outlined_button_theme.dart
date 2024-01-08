import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: YbColors.dark,
      side: const BorderSide(color: YbColors.borderPrimary),
      padding: const EdgeInsets.symmetric(vertical: YbSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(YbSizes.buttonRadius)),
      textStyle: const TextStyle(fontSize: 16, color: YbColors.black, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: YbColors.light,
      side: const BorderSide(color: YbColors.borderPrimary),
      padding: const EdgeInsets.symmetric(vertical: YbSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(YbSizes.buttonRadius)),
      textStyle: const TextStyle(fontSize: 16, color: YbColors.textWhite, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
    ),
  );
}
