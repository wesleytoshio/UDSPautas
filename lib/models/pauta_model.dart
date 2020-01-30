import 'package:pautas_app/consts/tables_const.dart';

class Pauta {
  int id;  
  String titulo;  
  String descricao;
  String detalhes;  
  int autor; 
  String status;
  bool deletado;

  Pauta({this.id, this.titulo, this.descricao, this.detalhes, this.autor, this.status, this.deletado});   

  Pauta.fromJson(Map<String, dynamic> json) {
    this.id = json[PautasStructure.id];
    this.titulo = json[PautasStructure.titulo];
    this.descricao = json[PautasStructure.descricao];
    this.detalhes = json[PautasStructure.detalhes];
    this.autor = json[PautasStructure.autor];
    this.status = json[PautasStructure.status];
    this.deletado = json[PautasStructure.deletado] == 1;
  }
}