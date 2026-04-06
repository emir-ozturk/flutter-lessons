import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lessons/lessons/provider/user_model.dart';

part 'user_state.freezed.dart';

@freezed
sealed class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.success(UserModel user) = _Success;
  const factory UserState.error(String message) = _Error;
}
