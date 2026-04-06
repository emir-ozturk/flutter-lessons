import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lessons/lessons/provider/state/user_state.dart';
import 'package:lessons/lessons/provider/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserState state = const UserState.initial();

  void _emit(UserState newState) {
    state = newState;
    notifyListeners();
  }

  void setUser(UserModel user) async {
    _emit(const UserState.loading());

    try {
      await Future.delayed(const Duration(seconds: 1));
      log('user: $user');
      _emit(UserState.success(user));
    } catch (e) {
      _emit(UserState.error(e.toString()));
    }
  }
}
