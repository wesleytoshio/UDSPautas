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
  Future loadPautasFechadas() async {
    listPautasFechadas = null;
    List<Pauta> list = await RepositoryPautas.getAllPautas('F');
    listPautasFechadas = list;
  }

  @action
  Future loadPautasAbertas() async {
    listPautasAbertas = null;
    List<Pauta> list = await RepositoryPautas.getAllPautas('A');
    listPautasAbertas = list;
  }

  @action
  Future addPauta() async {
    try {
      Pauta pauta = Pauta(
          titulo: titulo,
          descricao: descricao,
          detalhes: detalhes,
          autorNome: autor,
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
}
