import 'package:filmku/models/cast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'casts.freezed.dart';

part 'casts.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Casts with _$Casts {
  const Casts._();

  const factory Casts({
    @Default(Isar.autoIncrement) int isarId,
    @Default(0) int id,
    @Default([]) List<Cast> casts,
  }) = _Casts;

  @override
  Id get isarId;
}
