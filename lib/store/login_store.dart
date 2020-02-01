import 'package:mobx/mobx.dart';
import 'package:pautas_app/classes/shared_preferences_app.dart';
import 'package:pautas_app/consts/messages_consts.dart';
import 'package:pautas_app/models/usuario_model.dart';
import 'package:pautas_app/repository/repository_usuarios.dart';
import 'package:pautas_app/classes/class_retorno.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final SharedPreferencesApp sharedPreferencesApp;
  @observable 
  Usuario currentUser;

  @observable
  String message;

  @observable
  bool logado;

  @observable
  bool logando = false;

  _LoginStoreBase(this.sharedPreferencesApp);

  @action
  Future<RetornoApp> logoutApp() async {
    sharedPreferencesApp.clearCredenciaisLogado();
    return await RepositoryUsuarios.logoutUsuario();
  }

  @action
  Future<RetornoApp> loginApp(String email, String senha) async {
    try {
      logado = false;
      message = '';
      currentUser = null;
      Usuario usuinput = Usuario(email: email, senha: senha);
      RetornoApp retorno = RetornoApp(message: '', object: null, status: false);
      if (_validateLoginInput(usuinput)) {
        logando = true;
        retorno =
            await RepositoryUsuarios.entrarUsuario(email.trim(), senha.trim());
        if (!retorno.status) {
          if (retorno.message == MessagesConsts.authErrorEmailNaoExiste) {
            message = MessagesConsts.emailIncorreto;
          } else if (retorno.message == MessagesConsts.authErrorEmailExiste) {
            message = MessagesConsts.emailExiste;
          } else if (retorno.message ==
              MessagesConsts.authErrorSenhaIncorreta) {
            message = MessagesConsts.senhaIncorreta;
          }
        } else {
          sharedPreferencesApp.setCredenciaisLogado(email, senha);
          currentUser = await RepositoryUsuarios.getUsuario(email);
          logado = retorno.status;
        }
      }
      logando = false;
      return retorno;
    } catch (e) {
      logado = false;
      logando = false;
      return RetornoApp(message: 'Error', object: null, status: false);
      
    }
  }

  bool _validateLoginInput(Usuario inputUsuario) {
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
