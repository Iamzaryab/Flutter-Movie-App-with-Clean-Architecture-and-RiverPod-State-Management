import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
part 'notification.freezed.dart';
part 'notification.g.dart';
@freezed
@Collection(ignore: {'copyWith'})
class NotificationModel with _$NotificationModel{
  const factory NotificationModel({
    @Default(Isar.autoIncrement) int id,
    @Default('') String title,
    @Default('') String message,
    @Default(false) bool positive,

})= _NotificationModel;

  @override
  Id get id;
}
