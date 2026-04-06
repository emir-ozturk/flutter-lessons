import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lessons/provider/state/user_provider.dart';
import 'package:provider/provider.dart';

class UserSaveButton extends StatelessWidget {
  const UserSaveButton({super.key, required this.onSave});
  final Function() onSave;

  @override
  Widget build(BuildContext context) {
    log('UserSaveButton build');

    return Consumer<UserProvider>(
      builder: (context, provider, child) => ElevatedButton(
        onPressed: provider.state.when(
          initial: () => onSave(),
          loading: () => null,
          success: (user) => onSave(),
          error: (message) => null,
        ),
        child: const Text('Save'),
      ),
    );
  }
}
