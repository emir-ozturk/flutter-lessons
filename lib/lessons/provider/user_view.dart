import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lessons/lessons/provider/state/user_provider.dart';
import 'package:lessons/lessons/provider/user_model.dart';
import 'package:lessons/lessons/provider/widgets/user_save_button.dart';
import 'package:provider/provider.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    log('UserView dispose');
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('UserView build');

    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(title: Text('User')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16.0,
            children: [
              TextFormField(controller: nameController),
              TextFormField(controller: emailController),
              TextFormField(controller: passwordController),
              UserSaveButton(
                onSave: () {
                  final user = UserModel(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  context.read<UserProvider>().setUser(user);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
