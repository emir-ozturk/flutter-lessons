import 'package:flutter/material.dart';

final class GlassStyle {
  static const iconSize = 60.0;
  static const blur = 15.0;
  static final borderRadius = BorderRadius.circular(24);
  static final border = Border.all(color: Colors.white.withValues(alpha: 0.2));
  static final padding = EdgeInsets.all(12);
  static final margin = EdgeInsets.all(24);

  static final Decoration decoration = BoxDecoration(
    color: Colors.transparent,
    borderRadius: borderRadius,
    border: border,
    boxShadow: [
      BoxShadow(
        color: Colors.white.withValues(alpha: 0.15),
        blurRadius: 10,
        offset: Offset(0, 2),
      ),
    ],
  );

  static final Decoration iconDecoration = BoxDecoration(
    borderRadius: borderRadius,
    border: border,
  );
}
