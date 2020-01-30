import 'package:mobx/mobx.dart';
import 'package:pautas_app/classes/shared_preferences_app.dart';
import 'package:pautas_app/consts/messages_consts.dart';
import 'package:pautas_app/models/usuario_model.dart';
import 'package:pautas_app/repository/repository_usuarios.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  SharedPreferencesApp _sharedPreferencesApp = SharedPreferencesApp();
  
  @observable
  List<String> remembermeList;

  @observable 
  bool lembrarme = false;

  @observable
  String message = '';

  @observable
  Usuario usuario;

  @observable 
  int idUsuLogado = 0;

  @observable
  bool showText = false;

  @action
  showTextPass() {
    showText = !showText;  
  }

  @action
  loginApp(Usuario usuario) {
    message = '';
    _validateLoginInput(usuario);
    _loadUsuario().then((usu) {
      if (usu == null) {
        message = MessagesConsts.emailIncorreto;
      } else if (usuario.senha != usu.senha) {
        message = MessagesConsts.senhaIncorreta;
      } else {
        usu = usuario;
        _sharedPreferencesApp.setUsuarioLogado(usuario.id);
      }
    });
  }

  @action
  setLembrarme(bool check) {
    _sharedPreferencesApp.setLembrarme(check);
  }

  @action 
  loadPreferences() {
    _sharedPreferencesApp.loadSharedPreferences();
    _getRememberMe().then((lembrarme) {
      remembermeList = lembrarme;
    });
    lembrarme = _sharedPreferencesApp.getLembrarme; 
    idUsuLogado = _sharedPreferencesApp.getUsuarioLogado;
  }

  Future<Usuario> _loadUsuario() {
    return RepositoryUsuarios.getUsuario(usuario);
  }

  Future<List<String>> _getRememberMe() async {
    return _sharedPreferencesApp.getEmailSenhaLembrarme;
  }

  _validateLoginInput(Usuario inputUsuario) {
    if ((inputUsuario.email.isEmpty || inputUsuario.email == null) &&
        (inputUsuario.senha.isEmpty || inputUsuario.senha == null)) {
      message = MessagesConsts.emailsenhaValidacao;
    }

    if ((inputUsuario.email.isEmpty || inputUsuario.email == null) &&
        (inputUsuario.senha.isNotEmpty || inputUsuario.senha != null)) {
      message = MessagesConsts.emailValidacao;
    }

    if ((inputUsuario.email.isNotEmpty || inputUsuario.email != null) &&
        (inputUsuario.senha.isEmpty || inputUsuario.senha == null)) {
      message = MessagesConsts.senhaValidacao;
    }

    if (inputUsuario.email.contains('@') == false) {
      message = MessagesConsts.emailInvalido;
    }
  } 
}
