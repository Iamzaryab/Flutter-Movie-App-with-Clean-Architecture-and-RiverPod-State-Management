import 'package:isar/isar.dart';

abstract class LocalDb {
  Future<void> initDb();
  Isar getDb();
  Future<void> cleanDb();

}


