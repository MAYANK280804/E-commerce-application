import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    checkmarkColor: YbColors.white,
    selectedColor: YbColors.primary,
    disabledColor: YbColors.grey.withOpacity(0.4),
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    labelStyle: const TextStyle(color: YbColors.black, fontFamily: 'Poppins'),
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    checkmarkColor: YbColors.white,
    selectedColor: YbColors.primary,
    disabledColor: YbColors.darkerGrey,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    labelStyle: TextStyle(color: YbColors.white, fontFamily: 'Poppins'),
  );
}
