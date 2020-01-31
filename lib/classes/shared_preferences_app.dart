import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesApp {
  SharedPreferences prefs;

  loadSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
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
