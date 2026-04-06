import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lessons/provider/user_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    log('MainApp build');

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserView(),
    );
  }
}
