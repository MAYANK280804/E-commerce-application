import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: YbColors.darkGrey,
    suffixIconColor: YbColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: YbSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: YbSizes.fontSizeMd, color: YbColors.black, fontFamily: 'Poppins'),
    hintStyle: const TextStyle().copyWith(fontSize: YbSizes.fonYbSizesm, color: YbColors.black, fontFamily: 'Poppins'),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal, fontFamily: 'Poppins'),
    floatingLabelStyle: const TextStyle().copyWith(color: YbColors.black.withOpacity(0.8), fontFamily: 'Poppins'),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(YbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: YbColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(YbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: YbColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(YbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: YbColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(YbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: YbColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(YbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: YbColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: YbColors.darkGrey,
    suffixIconColor: YbColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: YbSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: YbSizes.fontSizeMd, color: YbColors.white, fontFamily: 'Poppins'),
    hintStyle: const TextStyle().copyWith(fontSize: YbSizes.fonYbSizesm, color: YbColors.white, fontFamily: 'Poppins'),
    floatingLabelStyle: const TextStyle().copyWith(color: YbColors.white.withOpacity(0.8), fontFamily: 'Poppins'),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(YbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: YbColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(YbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: YbColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(YbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: YbColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(YbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: YbColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(YbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: YbColors.warning),
    ),
  );
}
