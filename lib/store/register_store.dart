import 'package:mobx/mobx.dart';
import 'package:pautas_app/consts/messages_consts.dart';
import 'package:pautas_app/repository/repository_usuarios.dart';
import 'package:pautas_app/classes/class_retorno.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  @observable
  String nome = '';

  @observable
  String email = '';

  @observable
  String senha = '';

  @observable
  String message;

  @observable
  bool registrado = false;

  @observable
  bool registrando = false;

  @computed
  bool get exibirBotao =>
      (nome.isNotEmpty && email.isNotEmpty && senha.isNotEmpty);

  @action
  setNome(String aNome) {
    nome = aNome;
  }

  @action
  setEmail(String aEmail) {
    email = aEmail;
  }

  @action
  setSenha(String aSenha) {
    senha = aSenha;
  }

  @action
  newUsuario() async {
    if (_validateRegister(email, senha)) {
      registrando = true;
      RetornoApp retorno =
          await RepositoryUsuarios.registrarUsuario(email.trim(), senha.trim(), nome.trim());

      if (!retorno.status) {
        message = MessagesConsts.emailExiste;
      } else {
        if (retorno.message == '') {}
        message = MessagesConsts.cadastroCorreto;
      }
      registrado = retorno.status;
      registrando = false;
    }
  }

  bool _validateRegister(String email, String senha) {
    message = '';
    if (!email.contains('@')) {
      message = MessagesConsts.emailInvalido;
    } else if (senha.length < 6) {
      message = MessagesConsts.senhaPequena;
    }
    return message.isEmpty;
  }
}
