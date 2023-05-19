import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'test_model.freezed.dart';
part 'test_model.g.dart';

@freezed
class TestModel with _$TestModel {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory TestModel({
    @Default("") String name,
    @Default(0) int price,
    @Default(0) int mrp,
    @Default("") String method,
  }) = _TestModel;

  factory TestModel.fromJson(Map<String, Object?> json) =>
      _$TestModelFromJson(json);
}
