import 'dart:developer';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper db = DatabaseHelper._();
}

Database? contact;

Future<Database?> get initDatabase async {
  if (contact != null) {
    return contact;
  }

  contact = await initDB();
  return contact;
}

initDB() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, "contactList.db");
  return await openDatabase(path, version: 1, onOpen: (db) {
    log("DB OPEN");
  }, onCreate: (Database db, int version) async {
    log("DB Created");
    await db.execute("CREATE TABLE contact("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "name TEXT,"
        "contact TEXT,"
        "address TEXT "
        ")");
  });
}
