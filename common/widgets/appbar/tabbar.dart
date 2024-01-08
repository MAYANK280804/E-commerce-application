import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

/// A custom tab bar widget with customizable appearance.
class YbTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// Default constructor for the YbTabBar.
  ///
  /// Parameters:
  ///   - tabs: List of widgets representing the tabs.
  const YbTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = YbHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? YbColors.black : YbColors.white, // Background color of the tab bar
      child: TabBar(
        tabs: tabs, // List of tabs
        isScrollable: true, // Enable scrollable tabs
        indicatorColor: YbColors.primary, // Color of the tab indicator
        labelColor: dark ? YbColors.white : YbColors.primary, // Color of the selected tab label
        unselectedLabelColor: YbColors.darkGrey, // Color of unselected tab labels
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(YbDeviceUtils.geYbAppBarHeight()); // Preferred size of the tab bar
}
