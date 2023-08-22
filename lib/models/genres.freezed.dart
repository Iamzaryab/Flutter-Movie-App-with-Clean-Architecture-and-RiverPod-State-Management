// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genres.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Genres {
  int get id => throw _privateConstructorUsedError;
  List<Genre> get genres => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenresCopyWith<Genres> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenresCopyWith<$Res> {
  factory $GenresCopyWith(Genres value, $Res Function(Genres) then) =
      _$GenresCopyWithImpl<$Res, Genres>;
  @useResult
  $Res call({int id, List<Genre> genres});
}

/// @nodoc
class _$GenresCopyWithImpl<$Res, $Val extends Genres>
    implements $GenresCopyWith<$Res> {
  _$GenresCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? genres = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenresCopyWith<$Res> implements $GenresCopyWith<$Res> {
  factory _$$_GenresCopyWith(_$_Genres value, $Res Function(_$_Genres) then) =
      __$$_GenresCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, List<Genre> genres});
}

/// @nodoc
class __$$_GenresCopyWithImpl<$Res>
    extends _$GenresCopyWithImpl<$Res, _$_Genres>
    implements _$$_GenresCopyWith<$Res> {
  __$$_GenresCopyWithImpl(_$_Genres _value, $Res Function(_$_Genres) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? genres = null,
  }) {
    return _then(_$_Genres(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ));
  }
}

/// @nodoc

class _$_Genres extends _Genres {
  const _$_Genres(
      {this.id = Isar.autoIncrement, final List<Genre> genres = const []})
      : _genres = genres,
        super._();

  @override
  @JsonKey()
  final int id;
  final List<Genre> _genres;
  @override
  @JsonKey()
  List<Genre> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  String toString() {
    return 'Genres(id: $id, genres: $genres)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Genres &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_genres));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenresCopyWith<_$_Genres> get copyWith =>
      __$$_GenresCopyWithImpl<_$_Genres>(this, _$identity);
}

abstract class _Genres extends Genres {
  const factory _Genres({final int id, final List<Genre> genres}) = _$_Genres;
  const _Genres._() : super._();

  @override
  int get id;
  @override
  List<Genre> get genres;
  @override
  @JsonKey(ignore: true)
  _$$_GenresCopyWith<_$_Genres> get copyWith =>
      throw _privateConstructorUsedError;
}
