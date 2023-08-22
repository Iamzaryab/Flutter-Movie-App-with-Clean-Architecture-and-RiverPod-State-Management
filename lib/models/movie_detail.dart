import 'package:filmku/models/genre.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'movie_detail.freezed.dart';

part 'movie_detail.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class MovieDetail with _$MovieDetail {
  const MovieDetail._();

  @JsonSerializable(explicitToJson: true)
  const factory MovieDetail(
      {@Default(Isar.autoIncrement) int isarId,
      @JsonKey(name: 'id') @Default(0) int id,
      @JsonKey(name: 'vote_count') @Default(0) int voteCount,
      @JsonKey(name: 'runtime') @Default(0) int runtime,
      @JsonKey(name: 'revenue') @Default(0) int revenue,
      @JsonKey(name: 'vote_average') @Default(0.0) double voteAverage,
      @JsonKey(name: 'popularity') @Default(0.0) double popularity,
      @JsonKey(name: 'adult') @Default(false) bool adult,
      @JsonKey(name: 'video') @Default(false) bool video,
      @JsonKey(name: 'backdrop_path') @Default('') String backdropPath,
      @JsonKey(name: 'status') @Default('') String status,
      @JsonKey(name: 'tagline') @Default('') String tagline,
      @JsonKey(name: 'title') @Default('') String title,
      @JsonKey(name: 'release_date') @Default('') String releaseDate,
      @JsonKey(name: 'poster_path') @Default('') String posterPath,
      @JsonKey(name: 'imdb_id') @Default('') String imdbId,
      @JsonKey(name: 'original_language') @Default('') String originalLanguage,
      @JsonKey(name: 'homepage') @Default('') String homepage,
      @JsonKey(name: 'original_title') @Default('') String originalTitle,
      @JsonKey(name: 'overview') @Default('') String overview,
      @JsonKey(name: 'genres') @Default([]) List<Genre> genres}) = _MovieDetail;

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);

  @override
  Id get isarId ;
}
