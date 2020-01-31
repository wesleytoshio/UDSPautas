import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pautas_app/classes/data_base_create.dart';
import 'package:pautas_app/classes/shared_preferences_app.dart';
import 'package:pautas_app/store/login_store.dart';
import 'package:pautas_app/views/home_view.dart';
import 'package:pautas_app/views/login_view.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseCreate().initDatabase();
  SharedPreferencesApp sharedPreferencesApp = SharedPreferencesApp();
  await sharedPreferencesApp.loadSharedPreferences();
  runApp(MyApp(
    sharedPreferencesApp: sharedPreferencesApp,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferencesApp sharedPreferencesApp;

  const MyApp({Key key, this.sharedPreferencesApp}) : super(key: key);

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
            accentColor: Colors.blue
          ),
          home: sharedPreferencesApp.getUsuarioLogado == 0
              ? LoginView()
              : HomePageView(),
        ),
      ),
      providers: [
        Provider<SharedPreferencesApp>(
          create: (_) => sharedPreferencesApp,
        ),
        Provider<LoginStore>(
          create: (_) => LoginStore(sharedPreferencesApp),
        )
      ],
    );
  }
}
