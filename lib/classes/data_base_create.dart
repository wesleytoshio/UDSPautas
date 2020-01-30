import 'dart:io';

import 'package:path/path.dart';
import 'package:pautas_app/consts/tables_const.dart';
import 'package:sqflite/sqflite.dart';

Database db;

class DatabaseCreate {
  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult,
      int insertAndUpdateQueryResult,
      List<dynamic> params]) {
    print(functionName);
    print(sql);
    if (params != null) {
      print(params);
    }
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> createUsuariosTable(Database db) async {
    final todoSql = '''CREATE TABLE ${TablesNameConst.usuarios}
    (
      ${UsuariosStructure.id} INTEGER PRIMARY KEY,
      ${UsuariosStructure.nome} TEXT,
      ${UsuariosStructure.email} TEXT
    );''';

    await db.execute(todoSql);
  }

  Future<void> createPautasTable(Database db) async {
    final todoSql = '''CREATE TABLE ${TablesNameConst.pautas}
    (
      ${PautasStructure.id} INTEGER PRIMARY KEY,
      ${PautasStructure.autor} INTEGER,
      ${PautasStructure.titulo} TEXT,
      ${PautasStructure.descricao} TEXT,
      ${PautasStructure.detalhes} TEXT,
      ${PautasStructure.status} CHARACTER(1),
      ${PautasStructure.deletado} BIT NOT NULL
    )''';

    await db.execute(todoSql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    if (await Directory(dirname(path)).exists() == false) {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('pautas_db');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await createUsuariosTable(db);
    await createPautasTable(db);
  }
}
