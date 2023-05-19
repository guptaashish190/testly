// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TestModel _$$_TestModelFromJson(Map<String, dynamic> json) => _$_TestModel(
      name: json['name'] as String? ?? "",
      price: json['price'] as int? ?? 0,
      mrp: json['mrp'] as int? ?? 0,
      method: json['method'] as String? ?? "",
    );

Map<String, dynamic> _$$_TestModelToJson(_$_TestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'mrp': instance.mrp,
      'method': instance.method,
    };
