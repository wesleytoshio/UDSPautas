import 'package:pautas_app/classes/data_base_create.dart';
import 'package:pautas_app/consts/tables_const.dart';
import 'package:pautas_app/models/usuario_model.dart';

class RepositoryUsuarios {
  static Future<Usuario> getUsuario(Usuario usuario) async {
    Usuario newUsuario;
    final sql = '''SELECT * FROM ${TablesNameConst.usuarios}
    WHERE ${UsuariosStructure.email} = ?''';
    List<dynamic> params = [usuario.email];
    final data = await db.rawQuery(sql, params);
    if (data.isNotEmpty) {
      newUsuario = Usuario.fromJson(data.first);
    } else {
      newUsuario= null;  
    }
    
    return newUsuario;
  }

  static Future<int> addUsuario(Usuario usuario) async {
    int newId = await usuariosCount();
    if (await getUsuario(usuario) == null) {
      final sql = '''INSERT INTO ${TablesNameConst.usuarios}
    (
      ${UsuariosStructure.id},
      ${UsuariosStructure.nome},
      ${UsuariosStructure.email},
      ${UsuariosStructure.senha}
    )
    VALUES (?,?,?,?)''';
      List<dynamic> params = [
        newId,
        usuario.nome,
        usuario.email,
        usuario.senha,
      ];
      final result = await db.rawInsert(sql, params);
      DatabaseCreate.databaseLog('Add usuario', sql, null, result, params);
      return result;
    }
  }

  static Future<void> updateTodo(Usuario usuario) async {
    final sql = '''UPDATE ${TablesNameConst.usuarios}
    SET 
    ${UsuariosStructure.nome} = ?,
    ${UsuariosStructure.senha} = ?,
    ${UsuariosStructure.email} = ?

    WHERE ${UsuariosStructure.id} = ?
    ''';

    List<dynamic> params = [
      usuario.nome,
      usuario.senha,
      usuario.email,
      usuario.id
    ];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreate.databaseLog('Update pauta', sql, null, result, params);
  }

  static Future<int> usuariosCount() async {
    final data =
        await db.rawQuery('''SELECT COUNT(*) FROM ${TablesNameConst.usuarios}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }
}
