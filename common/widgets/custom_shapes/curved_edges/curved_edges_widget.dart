import 'package:flutter/material.dart';

import 'curved_edges.dart';

/// Widget that adds curved edges to its child using a custom clipper.
class YbCurvedEdgesWidget extends StatelessWidget {
  /// Create a widget with curved edges.
  const YbCurvedEdgesWidget({
    super.key,
    required this.child,
  });

  /// The child widget to be wrapped with curved edges.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      // Use the custom clipper to create curved edges
      clipper: YbCustomCurvedEdges(),
      child: child,
    );
  }
}
