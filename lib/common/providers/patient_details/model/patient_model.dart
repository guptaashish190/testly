import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_model.freezed.dart';
part 'patient_model.g.dart';

@freezed
class PatientModel with _$PatientModel {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory PatientModel({
    @Default("") String name,
    @Default(0) int age,
    @Default("") String sex,
  }) = _PatientModel;

  factory PatientModel.fromJson(Map<String, Object?> json) =>
      _$PatientModelFromJson(json);
}
