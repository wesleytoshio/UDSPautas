import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pautas_app/classes/class_retorno.dart';
import 'package:pautas_app/classes/shared_preferences_app.dart';
import 'package:pautas_app/models/usuario_model.dart';
import 'package:pautas_app/repository/repository_usuarios.dart';
import 'package:pautas_app/store/login_store.dart';
import 'package:pautas_app/store/pautas_store.dart';
part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  @observable
  bool autenticado;

  @action
  loadInstancesAndAuth() async {
    GetIt getIt = GetIt.instance;
    SharedPreferencesApp sharedPreferencesApp = SharedPreferencesApp();
    await sharedPreferencesApp.loadSharedPreferences();
    LoginStore loginStore = LoginStore(sharedPreferencesApp);
    Usuario usuLogin = sharedPreferencesApp.getCredenciaisLogado;
    if (usuLogin != null) {
      RetornoApp retorno =
          await loginStore.loginApp(usuLogin.email, usuLogin.senha);
      if (retorno.status) {
        autenticado = true;
      }
    } else {
      autenticado = false;
    }

    getIt.registerSingleton<PautasStore>(PautasStore());
    getIt.registerSingleton<RepositoryUsuarios>(RepositoryUsuarios());
    getIt.registerSingleton<LoginStore>(loginStore);
    getIt.registerSingleton<SharedPreferencesApp>(sharedPreferencesApp);
  }
}
