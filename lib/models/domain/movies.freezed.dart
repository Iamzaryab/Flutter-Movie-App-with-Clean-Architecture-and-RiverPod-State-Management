// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Movies {
  int get id => throw _privateConstructorUsedError;
  List<Movie> get movies => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;
  bool get cached => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoviesCopyWith<Movies> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesCopyWith<$Res> {
  factory $MoviesCopyWith(Movies value, $Res Function(Movies) then) =
      _$MoviesCopyWithImpl<$Res, Movies>;
  @useResult
  $Res call(
      {int id,
      List<Movie> movies,
      String type,
      int page,
      int totalPages,
      int totalResults,
      bool cached});
}

/// @nodoc
class _$MoviesCopyWithImpl<$Res, $Val extends Movies>
    implements $MoviesCopyWith<$Res> {
  _$MoviesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? movies = null,
    Object? type = null,
    Object? page = null,
    Object? totalPages = null,
    Object? totalResults = null,
    Object? cached = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      movies: null == movies
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      cached: null == cached
          ? _value.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoviesCopyWith<$Res> implements $MoviesCopyWith<$Res> {
  factory _$$_MoviesCopyWith(_$_Movies value, $Res Function(_$_Movies) then) =
      __$$_MoviesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      List<Movie> movies,
      String type,
      int page,
      int totalPages,
      int totalResults,
      bool cached});
}

/// @nodoc
class __$$_MoviesCopyWithImpl<$Res>
    extends _$MoviesCopyWithImpl<$Res, _$_Movies>
    implements _$$_MoviesCopyWith<$Res> {
  __$$_MoviesCopyWithImpl(_$_Movies _value, $Res Function(_$_Movies) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? movies = null,
    Object? type = null,
    Object? page = null,
    Object? totalPages = null,
    Object? totalResults = null,
    Object? cached = null,
  }) {
    return _then(_$_Movies(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      movies: null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      cached: null == cached
          ? _value.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Movies extends _Movies {
  const _$_Movies(
      {this.id = Isar.autoIncrement,
      final List<Movie> movies = const [],
      this.type = '',
      this.page = 0,
      this.totalPages = 0,
      this.totalResults = 0,
      this.cached = false})
      : _movies = movies,
        super._();

  @override
  @JsonKey()
  final int id;
  final List<Movie> _movies;
  @override
  @JsonKey()
  List<Movie> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int totalPages;
  @override
  @JsonKey()
  final int totalResults;
  @override
  @JsonKey()
  final bool cached;

  @override
  String toString() {
    return 'Movies(id: $id, movies: $movies, type: $type, page: $page, totalPages: $totalPages, totalResults: $totalResults, cached: $cached)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Movies &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            (identical(other.cached, cached) || other.cached == cached));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_movies),
      type,
      page,
      totalPages,
      totalResults,
      cached);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoviesCopyWith<_$_Movies> get copyWith =>
      __$$_MoviesCopyWithImpl<_$_Movies>(this, _$identity);
}

abstract class _Movies extends Movies {
  const factory _Movies(
      {final int id,
      final List<Movie> movies,
      final String type,
      final int page,
      final int totalPages,
      final int totalResults,
      final bool cached}) = _$_Movies;
  const _Movies._() : super._();

  @override
  int get id;
  @override
  List<Movie> get movies;
  @override
  String get type;
  @override
  int get page;
  @override
  int get totalPages;
  @override
  int get totalResults;
  @override
  bool get cached;
  @override
  @JsonKey(ignore: true)
  _$$_MoviesCopyWith<_$_Movies> get copyWith =>
      throw _privateConstructorUsedError;
}
