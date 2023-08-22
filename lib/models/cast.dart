import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'cast.freezed.dart';

part 'cast.g.dart';

@freezed
@Embedded(ignore: {'copyWith'})
class Cast with _$Cast {
  const factory Cast(
      {@JsonKey(name: 'id') @Default(0) int id,
      @JsonKey(name: 'name') @Default('') String name,
      @JsonKey(name: 'original_name') @Default('') String originalName,
      @JsonKey(name: 'profile_path') @Default('') String profilePath}) = _Cast;

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
}
