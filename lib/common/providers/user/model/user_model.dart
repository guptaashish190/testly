import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory UserModel({
    @Default("") String username,
    @Default("") String email,
    @Default("") String profilePicture,
    @Default("") String userId,
    @Default("") String phoneNumber,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
