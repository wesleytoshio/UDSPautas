import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pautas_app/models/base_model.dart';

class Pauta extends BaseModel {
  String _documentId;
  String titulo;
  String descricao;
  String detalhes;
  String autorId;
  String autorNome;
  String status;
  bool deletado;
  String data;
  bool expanded = false;

  Pauta(
      {this.titulo,
      this.descricao,
      this.detalhes,
      this.autorId,
      this.autorNome,
      this.status,
      this.data,
      this.deletado,
      this.expanded});

  Pauta.fromMap(DocumentSnapshot document) {
    _documentId = document.documentID;

    this.titulo = document.data["titulo"];
    this.descricao = document.data["descricao"];
    this.detalhes = document.data["detalhes"];
    this.autorId = document.data["autorId"];
    this.autorNome = document.data["autorNome"];
    this.data = document.data["data"];
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
    map['autorId'] = this.autorId;
    map['autorNome'] = this.autorNome;
    map['status'] = this.status;
    map['deletado'] = this.deletado;
    map['data'] = this.data;
    return map;
  }
}
