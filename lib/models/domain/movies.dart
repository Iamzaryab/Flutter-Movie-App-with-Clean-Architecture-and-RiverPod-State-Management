import 'package:filmku/models/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'movies.freezed.dart';

part 'movies.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Movies with _$Movies {
  const Movies._();
  @JsonSerializable(explicitToJson: true)
  const factory Movies({
    @Default(Isar.autoIncrement) int id,
    @Default([]) List<Movie> movies,
    @Default('') String type,
    @Default(0) int page,
    @Default(0) int totalPages,
    @Default(0) int totalResults,
    @Default(false) bool cached,
  }) = _Movies;

  @override
  Id get id;
}
