import 'package:flutter/material.dart';
import 'package:lessons/glass_bottom_bar/glass_container.dart';
import 'package:lessons/glass_bottom_bar/glass_icon.dart';
import 'package:lessons/glass_bottom_bar/glass_style.dart';

class GlassBottomBar extends StatelessWidget {
  const GlassBottomBar({super.key, required this.icons});
  final List<GlassIcon> icons;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      margin: GlassStyle.margin,
      padding: GlassStyle.padding,
      child: Row(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: icons,
      ),
    );
  }
}
