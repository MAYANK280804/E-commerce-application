import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class YbAppBarTheme {
  YbAppBarTheme._();

  static const lighYbAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: YbColors.black, size: YbSizes.iconMd),
    actionsIconTheme: IconThemeData(color: YbColors.black, size: YbSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: YbColors.black, fontFamily: 'Poppins'),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: YbColors.black, size: YbSizes.iconMd),
    actionsIconTheme: IconThemeData(color: YbColors.white, size: YbSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: YbColors.white, fontFamily: 'Poppins'),
  );
}
