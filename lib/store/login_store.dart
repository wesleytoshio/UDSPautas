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
  String message;

  @observable
  bool logado;

  _LoginStoreBase(this.sharedPreferencesApp);

  @action 
  Future<RetornoApp> logoutApp() async {
    return await RepositoryUsuarios.logoutUsuario();
  }

  @action
  Future<RetornoApp> loginApp(String email, String senha) async {
    Usuario usuinput = Usuario(email: email, senha: senha);
    RetornoApp retorno = RetornoApp(message: '', object: null, status: false);
    if (_validateLoginInput(usuinput)) {
      retorno = await RepositoryUsuarios.entrarUsuario(email.trim(), senha.trim());
      if (!retorno.status) {
        if (retorno.message == MessagesConsts.authErrorEmailNaoExiste) {
          message = MessagesConsts.emailIncorreto;   
        } else 
        if (retorno.message == MessagesConsts.authErrorEmailExiste) {
          message = MessagesConsts.emailExiste;   
        } else 
        if (retorno.message == MessagesConsts.authErrorSenhaIncorreta) {
          message = MessagesConsts.senhaIncorreta;   
        }
      } else {
        logado = retorno.status;
        sharedPreferencesApp.setCredenciaisLogado(email, senha);
      }
    }
    return retorno;
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
