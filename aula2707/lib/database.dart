import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  DBProvider();

  static Database _database;

  Future<Database> get database async {
    if(_database != null) return _database;
    return await initDB();
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = "${documentsDirectory.path}aula.db";
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute("create table tarefas(id integer, titulo text, ok integer);");
  }

  selectAll() async {
    final db = await database;
    return await db.query("tarefas");
  }

  insert(Map<String, dynamic> values) async {
    final db = await database;
    return await db.insert("tarefas", values);
  }

  update(Map<String, dynamic> values, int id) async{
    final db = await database;
    return await db.update("tarefas", values, where: "id = ?", whereArgs: [id]);
  }

  remove(int id) async {
    final db = await database;
    return await db.delete("tarefas", where: "id = ?", whereArgs: [id]);
  }

}