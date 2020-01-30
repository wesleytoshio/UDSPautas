import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesApp {
  SharedPreferences prefs;

  loadSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  setLembrarme(bool lembrarme, {String email, String senha}) async {
    if (prefs != null) {
      prefs.setBool('lembrarme', lembrarme);
      prefs.setString('email', email.isNotEmpty && lembrarme ? email : '');
      prefs.setString('senha', senha.isNotEmpty && lembrarme ? senha : '');
    }
  }

  List<String> get getEmailSenhaLembrarme {
    bool lembrarme = getLembrarme;
    List<String> login = [];
    if (lembrarme) {
      login.add(prefs.getString('email'));
      login.add(prefs.getString('senha'));
    }
    return login;
  }

  bool get getLembrarme {
    if (prefs != null) {
      if (prefs.containsKey('lembrarme') == false) {
        setLembrarme(false);
      }
      return prefs.getBool('lembrarme');
    }
  }

  setUsuarioLogado(int id) {
    prefs.setInt('idUsuarioLogado', id);
  }

  int get getUsuarioLogado {
    if (prefs != null) {
      if (prefs.containsKey('idUsuarioLogado') == false) {
        setUsuarioLogado(0);
      }
      return prefs.getInt('idUsuarioLogado');
    }
  }

  clearUsuarioLogado() {
    prefs.setInt('idUsuarioLogado', 0);
  }
}
