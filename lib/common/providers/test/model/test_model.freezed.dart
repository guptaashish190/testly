// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TestModel _$TestModelFromJson(Map<String, dynamic> json) {
  return _TestModel.fromJson(json);
}

/// @nodoc
mixin _$TestModel {
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get mrp => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestModelCopyWith<TestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestModelCopyWith<$Res> {
  factory $TestModelCopyWith(TestModel value, $Res Function(TestModel) then) =
      _$TestModelCopyWithImpl<$Res, TestModel>;
  @useResult
  $Res call({String name, int price, int mrp, String method});
}

/// @nodoc
class _$TestModelCopyWithImpl<$Res, $Val extends TestModel>
    implements $TestModelCopyWith<$Res> {
  _$TestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? mrp = null,
    Object? method = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      mrp: null == mrp
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as int,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TestModelCopyWith<$Res> implements $TestModelCopyWith<$Res> {
  factory _$$_TestModelCopyWith(
          _$_TestModel value, $Res Function(_$_TestModel) then) =
      __$$_TestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int price, int mrp, String method});
}

/// @nodoc
class __$$_TestModelCopyWithImpl<$Res>
    extends _$TestModelCopyWithImpl<$Res, _$_TestModel>
    implements _$$_TestModelCopyWith<$Res> {
  __$$_TestModelCopyWithImpl(
      _$_TestModel _value, $Res Function(_$_TestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? mrp = null,
    Object? method = null,
  }) {
    return _then(_$_TestModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      mrp: null == mrp
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as int,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_TestModel with DiagnosticableTreeMixin implements _TestModel {
  const _$_TestModel(
      {this.name = "", this.price = 0, this.mrp = 0, this.method = ""});

  factory _$_TestModel.fromJson(Map<String, dynamic> json) =>
      _$$_TestModelFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int price;
  @override
  @JsonKey()
  final int mrp;
  @override
  @JsonKey()
  final String method;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TestModel(name: $name, price: $price, mrp: $mrp, method: $method)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TestModel'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('mrp', mrp))
      ..add(DiagnosticsProperty('method', method));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TestModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.mrp, mrp) || other.mrp == mrp) &&
            (identical(other.method, method) || other.method == method));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, price, mrp, method);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TestModelCopyWith<_$_TestModel> get copyWith =>
      __$$_TestModelCopyWithImpl<_$_TestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TestModelToJson(
      this,
    );
  }
}

abstract class _TestModel implements TestModel {
  const factory _TestModel(
      {final String name,
      final int price,
      final int mrp,
      final String method}) = _$_TestModel;

  factory _TestModel.fromJson(Map<String, dynamic> json) =
      _$_TestModel.fromJson;

  @override
  String get name;
  @override
  int get price;
  @override
  int get mrp;
  @override
  String get method;
  @override
  @JsonKey(ignore: true)
  _$$_TestModelCopyWith<_$_TestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
