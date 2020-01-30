import 'package:mobx/mobx.dart';
import 'package:pautas_app/consts/messages_consts.dart';
import 'package:pautas_app/models/usuario_model.dart';
import 'package:pautas_app/repository/repository_usuarios.dart';

import '../classes/shared_preferences_app.dart';
import '../models/usuario_model.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final SharedPreferencesApp sharedPreferencesApp;

  _LoginStoreBase(this.sharedPreferencesApp);

  @observable
  String message;

  @observable
  bool showText = true;

  @observable
  List<String> lembrarmeEmailSenha = [];

  @observable
  bool lembrarme;

  @action
  loadLembrarme() {
    lembrarme = sharedPreferencesApp.getLembrarme;
    lembrarmeEmailSenha = sharedPreferencesApp.getEmailSenhaLembrarme;
  }

  @action
  setLembrarme({bool lembrar, String email, String senha}) {
    sharedPreferencesApp.setLembrarme(lembrar, email: email, senha: senha);
    lembrarmeEmailSenha = [];
    lembrarmeEmailSenha.add(email);
    lembrarmeEmailSenha.add(senha);
    lembrarme = lembrar;
  }

  @action
  showTextPass() {
    showText = !showText;
  }

  @action
  loginApp(String email, String senha) async {
    Usuario usuario = Usuario(email: email, senha: senha);
    message = '';
    await _validateLoginInput(usuario);
    if (message.isEmpty) {
      Usuario usu = await RepositoryUsuarios.getUsuario(usuario);
      if (usu == null) {
        message = MessagesConsts.emailIncorreto;
      } else if (usuario.senha != usu.senha) {
        message = MessagesConsts.senhaIncorreta;
      } else {
        usu = usuario;
      }
    }
  }

  _validateLoginInput(Usuario inputUsuario) {
    if ((inputUsuario.email.isEmpty || inputUsuario.email == null) &&
        (inputUsuario.senha.isEmpty || inputUsuario.senha == null)) {
      message = MessagesConsts.emailsenhaValidacao;
    } else if ((inputUsuario.email.isEmpty || inputUsuario.email == null) &&
        (inputUsuario.senha.isNotEmpty || inputUsuario.senha != null)) {
      message = MessagesConsts.emailValidacao;
    } else if ((inputUsuario.email.isNotEmpty || inputUsuario.email != null) &&
        (inputUsuario.senha.isEmpty || inputUsuario.senha == null)) {
      message = MessagesConsts.senhaValidacao;
    } else if (inputUsuario.email.contains('@') == false) {
      message = MessagesConsts.emailInvalido;
    }
  }
}
