import 'package:mobx/mobx.dart';
import 'package:pautas_app/classes/shared_preferences_app.dart';
import 'package:pautas_app/consts/messages_consts.dart';
import 'package:pautas_app/models/usuario_model.dart';
import 'package:pautas_app/repository/repository_usuarios.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final SharedPreferencesApp sharedPreferencesApp;
  @observable
  String message;

  @observable
  bool logado;

  _LoginStoreBase(this.sharedPreferencesApp);

  @action
  Future<Usuario> loginApp(String email, String senha) async {
    Usuario usuinput = Usuario(email: email, senha: senha);
    Usuario usuRetorno;
    if (_validateLoginInput(usuinput)) {
      usuRetorno = await RepositoryUsuarios.getUsuario(usuinput);
      if (usuRetorno == null) {
        message = MessagesConsts.emailIncorreto;
      } else if (usuinput.senha != usuRetorno.senha) {
        message = MessagesConsts.senhaIncorreta;
      } else {
        logado = true;
        sharedPreferencesApp.setUsuarioLogado(usuRetorno.id);
      }
    }
    return usuRetorno;
  }

  bool _validateLoginInput(Usuario inputUsuario) {
    message = '';
    if ((inputUsuario.email.isEmpty || inputUsuario.email == null) &&
        (inputUsuario.senha.isEmpty || inputUsuario.senha == null)) {
      message = MessagesConsts.emailsenhaValidacao;
    } else if ((inputUsuario.email.isEmpty || inputUsuario.email == null) &&
        (inputUsuario.senha.isNotEmpty || inputUsuario.senha != null)) {
      message = MessagesConsts.emailValidacao;
    } else if ((inputUsuario.email.isNotEmpty || inputUsuario.email != null) &&
        (inputUsuario.senha.isEmpty || inputUsuario.senha == null)) {
      message = MessagesConsts.senhaValidacao;
    } else if (!inputUsuario.email.contains('@')) {
      message = MessagesConsts.emailInvalido;
    }
    return message.isEmpty;
  }
}
