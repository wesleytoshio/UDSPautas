import 'package:mobx/mobx.dart';
import 'package:pautas_app/models/pauta_model.dart';
import 'package:pautas_app/repository/repository_pautas.dart';
part 'pautas_store.g.dart';

class PautasStore = _PautasStoreBase with _$PautasStore;

abstract class _PautasStoreBase with Store {
  @observable
  List<Pauta> listPautas = [];
  
  @observable
  int ultimoExpandido;

  @computed
  int get ultimoExp => ultimoExpandido;

  @action 
  setUltimoExpandido(int value){
    ultimoExpandido = value;  
  }

  @action
  Future loadPautas() async {
    List<Pauta> list = await RepositoryPautas.getAllPautas();
    if (list.length == 0) {
      listPautas = null;
    } else {
      listPautas = list;
    }
  }
}
