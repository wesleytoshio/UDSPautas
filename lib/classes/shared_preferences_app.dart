import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesApp {
  SharedPreferences prefs;

  Future loadSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  setLembrarme(bool lembrarme, {String email, String senha}) async {
    prefs.setBool('lembrarme', lembrarme);
    prefs.setString('email', email.isNotEmpty && lembrarme ? email : '');
    prefs.setString('senha', senha.isNotEmpty && lembrarme ? senha : '');
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
    if (prefs.getBool('lembrarme') == null) {
      setLembrarme(false);
    }
    return prefs.getBool('lembrarme');
  }

  setUsuarioLogado(int id) {
    prefs.setInt('idUsuarioLogado', id);
  }

  int get getUsuarioLogado {
    if (prefs.getInt('idUsuarioLogado') == null) {
      setUsuarioLogado(0);
    }
    return prefs.getInt('idUsuarioLogado');
  }

  clearUsuarioLogado() {
    prefs.setInt('idUsuarioLogado', 0);
  }
}
