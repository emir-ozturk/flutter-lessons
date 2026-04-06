import 'package:flutter/material.dart';
import 'package:lessons/lessons/glass_bottom_bar/glass_style.dart';

class GlassIcon extends StatelessWidget {
  const GlassIcon({super.key, this.icon, required this.onPressed, this.child});
  final IconData? icon;
  final Widget? child;
  final VoidCallback onPressed;

  factory GlassIcon.custom({Widget? child, required VoidCallback onPressed}) {
    return GlassIcon(onPressed: onPressed, child: child);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GlassStyle.iconSize,
      width: GlassStyle.iconSize,
      decoration: GlassStyle.iconDecoration,
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: child ?? Icon(icon, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}
