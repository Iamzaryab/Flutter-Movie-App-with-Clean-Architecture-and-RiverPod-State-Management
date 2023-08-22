import 'package:filmku/models/genre.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'genres.freezed.dart';
part 'genres.g.dart';
@freezed
@Collection(ignore: {'copyWith'})
class Genres with _$Genres{

  const Genres._();
  const factory Genres({
   @Default(Isar.autoIncrement) int id,
   @Default([]) List<Genre> genres,
})= _Genres;

  @override
  Id get id;
}

