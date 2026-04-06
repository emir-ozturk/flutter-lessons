import 'package:flutter/material.dart';
import 'package:lessons/glass_bottom_bar/glass_bottom_bar.dart';
import 'package:lessons/glass_bottom_bar/glass_container.dart';
import 'package:lessons/glass_bottom_bar/glass_icon.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text("Home"),
      ),
      body: ListView.separated(
        itemCount: 10,
        padding: EdgeInsets.all(8),
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
        },
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white, width: 1),
            ),
          );
        },
      ),
      bottomNavigationBar: GlassBottomBar(
        icons: [
          GlassIcon.custom(
            child: Text(
              "1",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
          ),
          GlassIcon(icon: Icons.compass_calibration, onPressed: () {}),
          GlassIcon(icon: Icons.timelapse, onPressed: () {}),
          GlassIcon(
            icon: Icons.settings,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                barrierColor: Colors.transparent,
                builder: (context) {
                  return GlassContainer(child: Container(height: 500));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
