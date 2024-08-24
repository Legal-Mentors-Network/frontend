// ignore_for_file: avoid_classes_with_only_static_members

import 'package:lmn/data/config_table.dart';
import 'package:lmn/data/user_profile_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class Database {
  Database();

  static Future<void> delete() async {
    return sql.deleteDatabase(
      join(await sql.getDatabasesPath(), 'lmn_database_1.db'),
    );
  }

  static Future<sql.Database> initalise() async {
    return sql.openDatabase(
      join(await sql.getDatabasesPath(), 'lmn_database_1.db'),
      onCreate: (db, version) async {
        await ConfigTable(db).createTable();
        await UserProfileTable(db).createTable();
      },
      version: 1,
    );
  }
}
