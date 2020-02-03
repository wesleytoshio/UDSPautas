import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:pautas_app/consts/messages_consts.dart';
import 'package:pautas_app/models/pauta_model.dart';
import 'package:pautas_app/repository/repository_pautas.dart';
part 'pautas_store.g.dart';

class PautasStore = _PautasStoreBase with _$PautasStore;

abstract class _PautasStoreBase with Store {
  @observable
  String titulo = '';

  @observable
  String descricao = '';

  @observable
  String detalhes = '';

  @observable
  String autor = '';

  @observable
  String message = '';

  @observable
  bool salvo = false;

  @observable
  String autorId = '';

  @computed
  bool get showButton =>
      (titulo.isNotEmpty && descricao.isNotEmpty && detalhes.isNotEmpty);

  @observable
  List<Pauta> listPautasAbertas = [];

  @observable
  List<Pauta> listPautasFechadas = [];

  @observable
  String ultimoExpandido;

  @observable
  int pageIndex = 0;

  StreamSubscription<QuerySnapshot> subscriptionAbertas;
  StreamSubscription<QuerySnapshot> subscriptionFechadas;

  @computed
  String get ultimoExp => ultimoExpandido;

  @action
  setUltimoExpandido(String value) {
    ultimoExpandido = value;
  }

  @action
  setPageIndex(int value) {
    pageIndex = value;
    ultimoExpandido = '';
  }

  @action
  updateStatus(Pauta pauta, String novoStatus) async {
    pauta.status = novoStatus;
    await RepositoryPautas.update(pauta.documentId(), pauta);
  }

  @action
  deletePauta(Pauta pauta) async {
    await RepositoryPautas.delete(pauta.documentId());
  }

  @action
  Future loadPautas() async {
    listPautasAbertas = null;
    listPautasFechadas = null;
    listPautasAbertas = await RepositoryPautas.getAllPautas('A');
    listPautasFechadas = await RepositoryPautas.getAllPautas('F');
  }

  @action
  listenPautas() {
    if (subscriptionAbertas != null) subscriptionAbertas.cancel();
    if (subscriptionFechadas != null) subscriptionFechadas.cancel();

    subscriptionAbertas = Firestore.instance
        .collection('pautas')
        .where("status", isEqualTo: 'A')
        .snapshots()
        .listen((data) {
          listPautasAbertas = [];
      data.documents.forEach((f) {
        listPautasAbertas.add(Pauta.fromMap(f));
      });
    });

    subscriptionFechadas = Firestore.instance
        .collection('pautas')
        .where("status", isEqualTo: 'F')
        .snapshots()
        .listen((data){ 
          listPautasFechadas = [];
      data.documents.forEach((f) {
        listPautasFechadas.add(Pauta.fromMap(f));
      });
    });
  }

  @action
  Future addPauta() async {
    try {
      Pauta pauta = Pauta(
          titulo: titulo,
          descricao: descricao,
          detalhes: detalhes,
          autorNome: autor,
          autorId: autorId,
          status: 'A');
      await RepositoryPautas.add(pauta);
      message = MessagesConsts.pautaAdd;
      clearPauta();
      salvo = true;
    } catch (e) {
      salvo = false;
      message = MessagesConsts.errorPautaAdd;
    }
  }

  @action
  clearPauta() {
    titulo = '';
    descricao = '';
    detalhes = '';
    autor = '';
    salvo = false;
  }

  @action
  setTitulo(String titulo) {
    this.titulo = titulo;
  }

  @action
  setDescricao(String descricao) {
    this.descricao = descricao;
  }

  @action
  setDetalhes(String detalhes) {
    this.detalhes = detalhes;
  }

  @action
  setAutor(String autor) {
    this.autor = autor;
  }

  @action
  setAutorId(String autorId) {
    this.autorId = autorId;
  }
}
