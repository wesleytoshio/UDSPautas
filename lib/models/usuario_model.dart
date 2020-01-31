import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pautas_app/models/base_model.dart';

class Usuario extends BaseModel{
  String _documentId;  
  String nome;  
  String email;
  String senha;  

  Usuario({this.nome, this.email, this.senha});

    Usuario.fromMap(DocumentSnapshot document) {
    _documentId = document.documentID;

    this.nome = document.data["nome"];
    this.email = document.data["email"];
    this.senha = document.data["senha"];
  }

  @override
  String documentId() => _documentId;

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['nome'] = this.nome;
    map['email'] = this.email;
    map['senha'] = this.senha;
    return map;
  }
}