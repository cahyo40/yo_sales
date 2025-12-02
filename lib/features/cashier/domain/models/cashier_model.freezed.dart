// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashier_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CashierModel _$CashierModelFromJson(Map<String, dynamic> json) {
  return _CashierModel.fromJson(json);
}

/// @nodoc
mixin _$CashierModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this CashierModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CashierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashierModelCopyWith<CashierModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashierModelCopyWith<$Res> {
  factory $CashierModelCopyWith(
    CashierModel value,
    $Res Function(CashierModel) then,
  ) = _$CashierModelCopyWithImpl<$Res, CashierModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$CashierModelCopyWithImpl<$Res, $Val extends CashierModel>
    implements $CashierModelCopyWith<$Res> {
  _$CashierModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashierModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CashierModelImplCopyWith<$Res>
    implements $CashierModelCopyWith<$Res> {
  factory _$$CashierModelImplCopyWith(
    _$CashierModelImpl value,
    $Res Function(_$CashierModelImpl) then,
  ) = __$$CashierModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$CashierModelImplCopyWithImpl<$Res>
    extends _$CashierModelCopyWithImpl<$Res, _$CashierModelImpl>
    implements _$$CashierModelImplCopyWith<$Res> {
  __$$CashierModelImplCopyWithImpl(
    _$CashierModelImpl _value,
    $Res Function(_$CashierModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CashierModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$CashierModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CashierModelImpl implements _CashierModel {
  const _$CashierModelImpl({required this.id, required this.name});

  factory _$CashierModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CashierModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'CashierModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashierModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of CashierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashierModelImplCopyWith<_$CashierModelImpl> get copyWith =>
      __$$CashierModelImplCopyWithImpl<_$CashierModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CashierModelImplToJson(this);
  }
}

abstract class _CashierModel implements CashierModel {
  const factory _CashierModel({
    required final String id,
    required final String name,
  }) = _$CashierModelImpl;

  factory _CashierModel.fromJson(Map<String, dynamic> json) =
      _$CashierModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of CashierModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashierModelImplCopyWith<_$CashierModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
