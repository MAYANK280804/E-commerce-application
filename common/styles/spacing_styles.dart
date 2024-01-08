import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class YbSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: YbSizes.appBarHeight,
    left: YbSizes.defaultSpace,
    bottom: YbSizes.defaultSpace,
    right: YbSizes.defaultSpace,
  );
}
