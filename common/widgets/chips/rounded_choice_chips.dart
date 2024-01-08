import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/circular_container.dart';

/// A customized choice chip that can act like a radio button.
class YbChoiceChip extends StatelessWidget {
  /// Create a chip that acts like a radio button.
  ///
  /// Parameters:
  ///   - text: The label text for the chip.
  ///   - selected: Whether the chip is currently selected.
  ///   - onSelected: Callback function when the chip is selected.
  const YbChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Theme(
      // Use a transparent canvas color to match the existing styling.
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        // Use this function to get Colors as a Chip
        avatar: YbHelperFunctions.getColor(text) != null
            ? YbCircularContainer(width: 50, height: 50, backgroundColor: YbHelperFunctions.getColor(text)!)
            : null,
        selected: selected,
        onSelected: onSelected,
        backgroundColor: YbHelperFunctions.getColor(text),
        labelStyle: TextStyle(color: selected ? YbColors.white : null),
        shape: YbHelperFunctions.getColor(text) != null ? const CircleBorder() : null,
        label: YbHelperFunctions.getColor(text) == null ? Text(text) : const SizedBox(),
        padding: YbHelperFunctions.getColor(text) != null ? const EdgeInsets.all(0) : null,
        labelPadding: YbHelperFunctions.getColor(text) != null ? const EdgeInsets.all(0) : null,
      ),
    );
  }
}
