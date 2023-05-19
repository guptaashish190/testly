// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PatientModel _$$_PatientModelFromJson(Map<String, dynamic> json) =>
    _$_PatientModel(
      name: json['name'] as String? ?? "",
      age: json['age'] as int? ?? 0,
      sex: json['sex'] as String? ?? "",
    );

Map<String, dynamic> _$$_PatientModelToJson(_$_PatientModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'sex': instance.sex,
    };
