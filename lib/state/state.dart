import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/controllers/application_controller.dart';
import 'package:lmn/data/config_table.dart';
import 'package:lmn/data/database.dart';
import 'package:lmn/state/auth.dart';
import 'package:pocketbase/pocketbase.dart';

// sqflite
final databaseProvider = Provider((ref) async {
  // await Database.delete();
  return Database.initalise();
});

// pocketbase
final pocketbase = Provider((ref) async {
  final db = await ref.read(databaseProvider);
  final authenticatedUser = await ConfigTable(db).getItem(AuthNotifier.field);

  final store = AsyncAuthStore(
    // what about updating? maybe wrap both in 1 method and decide internally which to use
    save: (String data) async => ApplicationController(ref).setConfigItem(AuthNotifier.field, data),
    initial: authenticatedUser?.value ?? '',
  );

  // for dev use http://10.0.2.2:8090 for android or  htpp://127.0.0.1:8090 for ios

  final env = dotenv.env['PB'];
  return PocketBase(env!, authStore: store);
});
