import 'package:mobx/mobx.dart';
import 'package:pautas_app/consts/messages_consts.dart';
import 'package:pautas_app/models/usuario_model.dart';
import 'package:pautas_app/repository/repository_usuarios.dart';
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
  bool registrado;

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
    if (_validateRegister(email)) {
      registrado = false;
      Usuario newUsuario = Usuario(nome: nome, email: email, senha: senha);
      Usuario usuEmail = await RepositoryUsuarios.getUsuario(newUsuario);
      if (usuEmail == null) {
        int result = await RepositoryUsuarios.addUsuario(newUsuario);
        if (result == 0) {
          message = MessagesConsts.erroCadastro;
        } else {
          registrado = true;
          message = MessagesConsts.cadastroCorreto;  
        }
      } else {
        message = MessagesConsts.emailExiste;  
      }
    }
  }

  bool _validateRegister(String email) {
    message = '';
    if (!email.contains('@')) {
      message = MessagesConsts.emailInvalido;
    }
    return message.isEmpty;
  }
}
