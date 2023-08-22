// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'casts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Casts {
  int get isarId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  List<Cast> get casts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CastsCopyWith<Casts> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CastsCopyWith<$Res> {
  factory $CastsCopyWith(Casts value, $Res Function(Casts) then) =
      _$CastsCopyWithImpl<$Res, Casts>;
  @useResult
  $Res call({int isarId, int id, List<Cast> casts});
}

/// @nodoc
class _$CastsCopyWithImpl<$Res, $Val extends Casts>
    implements $CastsCopyWith<$Res> {
  _$CastsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isarId = null,
    Object? id = null,
    Object? casts = null,
  }) {
    return _then(_value.copyWith(
      isarId: null == isarId
          ? _value.isarId
          : isarId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      casts: null == casts
          ? _value.casts
          : casts // ignore: cast_nullable_to_non_nullable
              as List<Cast>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CastsCopyWith<$Res> implements $CastsCopyWith<$Res> {
  factory _$$_CastsCopyWith(_$_Casts value, $Res Function(_$_Casts) then) =
      __$$_CastsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int isarId, int id, List<Cast> casts});
}

/// @nodoc
class __$$_CastsCopyWithImpl<$Res> extends _$CastsCopyWithImpl<$Res, _$_Casts>
    implements _$$_CastsCopyWith<$Res> {
  __$$_CastsCopyWithImpl(_$_Casts _value, $Res Function(_$_Casts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isarId = null,
    Object? id = null,
    Object? casts = null,
  }) {
    return _then(_$_Casts(
      isarId: null == isarId
          ? _value.isarId
          : isarId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      casts: null == casts
          ? _value._casts
          : casts // ignore: cast_nullable_to_non_nullable
              as List<Cast>,
    ));
  }
}

/// @nodoc

class _$_Casts extends _Casts {
  const _$_Casts(
      {this.isarId = Isar.autoIncrement,
      this.id = 0,
      final List<Cast> casts = const []})
      : _casts = casts,
        super._();

  @override
  @JsonKey()
  final int isarId;
  @override
  @JsonKey()
  final int id;
  final List<Cast> _casts;
  @override
  @JsonKey()
  List<Cast> get casts {
    if (_casts is EqualUnmodifiableListView) return _casts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_casts);
  }

  @override
  String toString() {
    return 'Casts(isarId: $isarId, id: $id, casts: $casts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Casts &&
            (identical(other.isarId, isarId) || other.isarId == isarId) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._casts, _casts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isarId, id, const DeepCollectionEquality().hash(_casts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CastsCopyWith<_$_Casts> get copyWith =>
      __$$_CastsCopyWithImpl<_$_Casts>(this, _$identity);
}

abstract class _Casts extends Casts {
  const factory _Casts(
      {final int isarId, final int id, final List<Cast> casts}) = _$_Casts;
  const _Casts._() : super._();

  @override
  int get isarId;
  @override
  int get id;
  @override
  List<Cast> get casts;
  @override
  @JsonKey(ignore: true)
  _$$_CastsCopyWith<_$_Casts> get copyWith =>
      throw _privateConstructorUsedError;
}
