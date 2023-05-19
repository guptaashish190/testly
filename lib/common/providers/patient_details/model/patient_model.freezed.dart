// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) {
  return _PatientModel.fromJson(json);
}

/// @nodoc
mixin _$PatientModel {
  String get name => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  String get sex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientModelCopyWith<PatientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientModelCopyWith<$Res> {
  factory $PatientModelCopyWith(
          PatientModel value, $Res Function(PatientModel) then) =
      _$PatientModelCopyWithImpl<$Res, PatientModel>;
  @useResult
  $Res call({String name, int age, String sex});
}

/// @nodoc
class _$PatientModelCopyWithImpl<$Res, $Val extends PatientModel>
    implements $PatientModelCopyWith<$Res> {
  _$PatientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? age = null,
    Object? sex = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PatientModelCopyWith<$Res>
    implements $PatientModelCopyWith<$Res> {
  factory _$$_PatientModelCopyWith(
          _$_PatientModel value, $Res Function(_$_PatientModel) then) =
      __$$_PatientModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int age, String sex});
}

/// @nodoc
class __$$_PatientModelCopyWithImpl<$Res>
    extends _$PatientModelCopyWithImpl<$Res, _$_PatientModel>
    implements _$$_PatientModelCopyWith<$Res> {
  __$$_PatientModelCopyWithImpl(
      _$_PatientModel _value, $Res Function(_$_PatientModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? age = null,
    Object? sex = null,
  }) {
    return _then(_$_PatientModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_PatientModel with DiagnosticableTreeMixin implements _PatientModel {
  const _$_PatientModel({this.name = "", this.age = 0, this.sex = ""});

  factory _$_PatientModel.fromJson(Map<String, dynamic> json) =>
      _$$_PatientModelFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int age;
  @override
  @JsonKey()
  final String sex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PatientModel(name: $name, age: $age, sex: $sex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PatientModel'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('age', age))
      ..add(DiagnosticsProperty('sex', sex));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PatientModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.sex, sex) || other.sex == sex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, age, sex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientModelCopyWith<_$_PatientModel> get copyWith =>
      __$$_PatientModelCopyWithImpl<_$_PatientModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientModelToJson(
      this,
    );
  }
}

abstract class _PatientModel implements PatientModel {
  const factory _PatientModel(
      {final String name, final int age, final String sex}) = _$_PatientModel;

  factory _PatientModel.fromJson(Map<String, dynamic> json) =
      _$_PatientModel.fromJson;

  @override
  String get name;
  @override
  int get age;
  @override
  String get sex;
  @override
  @JsonKey(ignore: true)
  _$$_PatientModelCopyWith<_$_PatientModel> get copyWith =>
      throw _privateConstructorUsedError;
}
