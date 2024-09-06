import 'package:flutter/material.dart';
import 'package:lmn/models/config.dart';
import 'package:sqflite/sqflite.dart';

class ConfigTable {
  final Database db;

  ConfigTable(this.db);

  static String tableName = 'config';

  Future<void> createTable() async {
    try {
      await db.execute(
        """
          CREATE TABLE IF NOT EXISTS $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            field TEXT NOT NULL,
            value TEXT NOT NULL
          );
        """,
      );
    } catch (err) {
      debugPrint("failed to create table $tableName");
    }
  }

  Future<Config?> getItem(String field) async {
    try {
      final items = await db.rawQuery(
        """
          SELECT *
          FROM $tableName
          WHERE field = "$field"
        """,
      );

      if (items.isEmpty) return null;
      return Config.fromLocalDatabase(items.first);
    } catch (err) {
      debugPrint("failed to get $field from cache");
    }
    return null;
  }

  Future<int> setItem(String field, String value) async {
    try {
      return db.rawInsert(
        """
          INSERT INTO $tableName (field, value)
          VALUES (?, ?);
        """,
        [field, value],
      );
    } catch (err) {
      debugPrint("failed to save $field with $value to cache");
      return 0;
    }
  }

  Future<int> updateItem(int id, String value) async {
    try {
      return db.rawUpdate(
        """
            UPDATE $tableName
            SET value = '$value'
            WHERE id = '$id';
          """,
      );
    } catch (err) {
      debugPrint("failed to save $id with $value to cache");
      return 0;
    }
  }
}
