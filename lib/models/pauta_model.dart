import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pautas_app/models/base_model.dart';

class Pauta extends BaseModel {
  String _documentId;
  String titulo;
  String descricao;
  String detalhes;
  int autor;
  String status;
  bool deletado;

  Pauta(
      {this.titulo,
      this.descricao,
      this.detalhes,
      this.autor,
      this.status,
      this.deletado});

  Pauta.fromMap(DocumentSnapshot document) {
    _documentId = document.documentID;

    this.titulo = document.data["titulo"];
    this.descricao = document.data["descricao"];
    this.detalhes = document.data["detalhes"];
    this.autor = document.data["autor"];
    this.status = document.data["status"];
    this.deletado = document.data["deletado"];
  }

  @override
  String documentId() => _documentId;

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['titulo'] = this.titulo;
    map['descricao'] = this.descricao;
    map['detalhes'] = this.detalhes;
    map['autor'] = this.autor;
    map['status'] = this.status;
    map['deletado'] = this.deletado;
    return map;
  }
}
