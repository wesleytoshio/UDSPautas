import 'package:pautas_app/classes/data_base_create.dart';
import 'package:pautas_app/consts/tables_const.dart';
import 'package:pautas_app/models/pauta_model.dart';

class RepositoryPautas {
  static Future<List<Pauta>> getAllPautas({String status}) async {
    final sql = '''SELECT * FROM ${TablesNameConst.pautas}
    WHERE ${PautasStructure.deletado} = 0 
    AND ${PautasStructure.status} =  '$status'  ''';
    final data = await db.rawQuery(sql);
    List<Pauta> pautas = List();

    for (final registro in data) {
      final pauta = Pauta.fromJson(registro);
      pautas.add(pauta);
    }
    return pautas;
  }

  static Future<Pauta> getPauta(int id) async {
    final sql = '''SELECT * FROM ${TablesNameConst.pautas}
    WHERE ${PautasStructure.id} = ?''';

    List<dynamic> params = [id];
    final data = await db.rawQuery(sql, params);

    final pauta = Pauta.fromJson(data.first);
    return pauta;
  }

  static Future<void> addPauta(Pauta pauta) async {
    int newId = await pautasCount();
    final sql = '''INSERT INTO ${TablesNameConst.pautas}
    (
      ${PautasStructure.id},
      ${PautasStructure.titulo},
      ${PautasStructure.descricao},
      ${PautasStructure.detalhes},
      ${PautasStructure.status},
      ${PautasStructure.deletado},
      ${PautasStructure.autor}
    )
    VALUES (?,?,?,?,?,?,?)''';
    List<dynamic> params = [
      newId,
      pauta.titulo,
      pauta.descricao,
      pauta.detalhes,
      pauta.status,
      pauta.deletado ? 1 : 0,
      pauta.autor
    ];
    final result = await db.rawInsert(sql, params);
    DatabaseCreate.databaseLog('Add pauta', sql, null, result, params);
  }

  static Future<void> deletePauta(Pauta pauta) async {
    final sql = '''UPDATE ${TablesNameConst.pautas}
    SET ${PautasStructure.deletado} = 1
    WHERE ${PautasStructure.id} = ?
    ''';

    List<dynamic> params = [pauta.id];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreate.databaseLog('Delete pauta', sql, null, result, params);
  }

  static Future<void> updateTodo(Pauta pauta) async {
    final sql = '''UPDATE ${TablesNameConst.pautas}
    SET 
    ${PautasStructure.titulo} = ?,
    ${PautasStructure.descricao} = ?,
    ${PautasStructure.detalhes} = ?,
    ${PautasStructure.status} = ?

    WHERE ${PautasStructure.id} = ?
    ''';

    List<dynamic> params = [
      pauta.titulo,
      pauta.descricao,
      pauta.detalhes,
      pauta.status,
      pauta.id
    ];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreate.databaseLog('Update pauta', sql, null, result, params);
  }

  static Future<int> pautasCount() async {
    final data =
        await db.rawQuery('''SELECT COUNT(*) FROM ${TablesNameConst.pautas}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }
}
