import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pautas_app/classes/shared_preferences_app.dart';
import 'package:pautas_app/store/login_store.dart';
import 'package:pautas_app/views/home_view.dart';
import 'package:pautas_app/views/login_view.dart';
import 'package:provider/provider.dart';
import 'package:pautas_app/repository/repository_usuarios.dart';
import 'models/usuario_model.dart';
import 'classes/class_retorno.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesApp sharedPreferencesApp = SharedPreferencesApp();
  LoginStore loginStore = LoginStore(sharedPreferencesApp);
  await sharedPreferencesApp.loadSharedPreferences();
  bool logar = false;
  Usuario usuLogin = sharedPreferencesApp.getCredenciaisLogado;
  if (usuLogin != null) {
    RetornoApp retorno =
        await loginStore.loginApp(usuLogin.email, usuLogin.senha);
    if (retorno.status) {
      logar = true;
    }
  } else {
    logar = false;
  }

  runApp(MyApp(
    sharedPreferencesApp: sharedPreferencesApp,
    loginStore: loginStore,
    logar: logar,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferencesApp sharedPreferencesApp;
  final LoginStore loginStore;
  final bool logar;
  const MyApp({Key key, this.sharedPreferencesApp, this.loginStore, this.logar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: OKToast(
        child: MaterialApp(
          title: 'UDSPautas',
          debugShowCheckedModeBanner: false,
          theme: new ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.dark,
              accentColor: Colors.blue),
          home: logar ? HomePageView(): LoginView(),
        ),
      ),
      providers: [
        Provider<SharedPreferencesApp>(
          create: (_) => sharedPreferencesApp,
        ),
        Provider<LoginStore>(
          create: (_) => loginStore,
        ),
        Provider<RepositoryUsuarios>(
          create: (_) => RepositoryUsuarios(),
        ),
      ],
    );
  }
}
