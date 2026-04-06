import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lessons/lessons/glass_bottom_bar/glass_style.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
  });
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: GlassStyle.decoration,
      margin: margin,
      child: ClipRRect(
        borderRadius: GlassStyle.borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: GlassStyle.blur,
            sigmaY: GlassStyle.blur,
          ),
          child: Padding(padding: padding ?? EdgeInsets.zero, child: child),
        ),
      ),
    );
  }
}
