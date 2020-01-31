import 'package:pautas_app/models/usuario_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesApp {
  SharedPreferences prefs;

  loadSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  setCredenciaisLogado(String email, String senha) {
    prefs.setString('email', email);
    prefs.setString('senha', senha);
  }

  Usuario get getCredenciaisLogado {
    Usuario usuario;
    if (prefs.getString('email') == '' || prefs.getString('email') == null) {
      usuario = null;
    } else {
      usuario = new Usuario(email: prefs.getString('email'), senha: prefs.getString('senha'));
    }
    return usuario;
  }

  clearCredenciaisLogado() {
    prefs.setString('email', '');
    prefs.setString('senha', '');
  }
}
