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
    String path = "${documentsDirectory.path}projeto.db";
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute("create table empresa(id integer, empresa text, cnpj text, responsavel text, telefone text, email text, endereco text, endereco2 text, estado text, cidade text, ramo text);");
  }

  selectAll() async {
    final db = await database;
    return await db.query("empresa");
  }

  selectByCity(String cidade) async {
    final db = await database;
    return await db.rawQuery("SELECT * FROM empresa WHERE cidade LIKE '%$cidade%'");
  }

  selectById(int id) async {
    final db = await database;
    return await db.rawQuery("SELECT * FROM empresa WHERE id = $id");
  }

  insert(Map<String, dynamic> values) async {
    final db = await database;
    return await db.insert("empresa", values);
  }

  update(Map<String, dynamic> values, int id) async{
    final db = await database;
    return await db.update("empresa", values, where: "id = ?", whereArgs: [id]);
  }

  remove(int id) async {
    final db = await database;
    return await db.delete("empresa", where: "id = ?", whereArgs: [id]);
  }

  //FUNCTION CRIADA PARA TESTE
  removeAll() async {
    final db = await database;
    return await db.delete("empresa");
  }

}