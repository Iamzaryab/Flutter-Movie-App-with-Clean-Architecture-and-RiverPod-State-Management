import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'genre.freezed.dart';

part 'genre.g.dart';

@freezed
@Embedded(ignore: {'copyWith'})
class Genre with _$Genre {
  const factory Genre(
      {@JsonKey(name: 'id') @Default(0) int id,
      @JsonKey(name: 'name') @Default('') String name}) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
