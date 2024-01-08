import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// A circular loader widget with customizable foreground and background colors.
class YbCircularLoader extends StatelessWidget {
  /// Default constructor for the YbCircularLoader.
  ///
  /// Parameters:
  ///   - foregroundColor: The color of the circular loader.
  ///   - backgroundColor: The background color of the circular loader.
  const YbCircularLoader({
    super.key,
    this.foregroundColor = YbColors.white,
    this.backgroundColor = YbColors.primary,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(YbSizes.lg),
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle), // Circular background
      child: Center(
        child: CircularProgressIndicator(color: foregroundColor, backgroundColor: Colors.transparent), // Circular loader
      ),
    );
  }
}
