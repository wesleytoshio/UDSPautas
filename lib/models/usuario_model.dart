import 'package:pautas_app/consts/tables_const.dart';

class Usuario {
  int id;  
  String nome;  
  String email;
  String senha;  

  Usuario({this.id, this.nome, this.email, this.senha});

  Usuario.fromJson(Map<String, dynamic> json) {
    this.id = json[UsuariosStructure.id];
    this.nome = json[UsuariosStructure.nome];
    this.email = json[UsuariosStructure.email];
    this.senha = json[UsuariosStructure.senha];
  }
}