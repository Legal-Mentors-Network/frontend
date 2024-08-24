import 'package:flutter/material.dart';
import 'package:lmn/common/exceptions/user_profile_exception.dart';
import 'package:sqflite/sqflite.dart';

class UserProfileTable {
  final Database db;

  UserProfileTable(this.db);

  static String tableName = 'user_profile';

  static UserProfileTableFields fields = UserProfileTableFields(
    tagline: "tagline",
    dateOfBirth: 'date_of_birth',
  );

  // skipping unimportant details for now like what does mentorship mean to me
  // need to add name or store in pb user?
  Future<void> createTable() async {
    try {
      await db.execute(
        """
        CREATE TABLE IF NOT EXISTS $tableName (
          id TEXT NOT NULL PRIMARY KEY,
          ${fields.tagline} TEXT,
          ${fields.dateOfBirth} TEXT,
          role TEXT,
          location TEXT,
          latitude TEXT,
          longitude TEXT,
          max_distance INTEGER,
          min_age INTEGER,
          max_age INTEGER,
          gender TEXT
        );
        """,
      );
    } catch (err) {
      debugPrint("failed to create table $tableName");
    }
  }

  Future createUserProfile(String userId) async {
    try {
      return db.rawInsert(
        """
        INSERT INTO $tableName (id)
        VALUES (?)
        """,
        [userId],
      );
    } catch (err) {
      debugPrint("Failed to create profile $err");
    }
  }

  Future debugAll() async {
    try {
      final items = await db.rawQuery(
        """
        SELECT *
        FROM $tableName
        """,
      );

      if (items.isEmpty) {
        debugPrint("No results in $tableName");
        return;
      }

      for (final item in items) {
        debugPrint("item $item");
      }
    } catch (err) {
      debugPrint("Failed to query and debug all");
    }
  }

  Future debugUser(String userId) async {
    try {
      final items = await db.rawQuery(
        """
        SELECT *
        FROM $tableName
        WHERE $tableName.id = '$userId'
        """,
      );

      if (items.isEmpty) return;
      debugPrint(items.first.toString());
    } catch (err) {
      debugPrint("Failed to debug user");
    }
  }

  Future get(String userId, String field) async {
    try {
      final items = await db.rawQuery(
        """
      SELECT $field
      FROM $tableName
      WHERE $tableName.id = '$userId'
      """,
      );

      if (items.isEmpty) return null;
      return items.first[field] ?? '';
    } catch (err) {
      debugPrint("Failed to get $field where user id = $userId $err");
    }
  }

  Future set(String userId, String field, String value) async {
    try {
      final result = await db.rawUpdate(
        """
        UPDATE $tableName
        SET $field = ?
        WHERE $tableName.id = ?
        """,
        [value, userId],
      );

      if (result == 0) {
        throw UserProfileException(
          code: UserProfileExceptionCodes.userProfileDoesNotExist,
          cause: "Failed to update field $field with value $value for user $userId",
        );
      }
    } on UserProfileException {
      rethrow;
    } catch (err) {
      debugPrint("Failed to update $tableName where $field = $value and user id = $userId");
    }
  }
}

class UserProfileTableFields {
  final String tagline;
  final String dateOfBirth;

  UserProfileTableFields({required this.tagline, required this.dateOfBirth});
}
