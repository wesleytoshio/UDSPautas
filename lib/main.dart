import 'package:flutter/material.dart';
import 'package:pautas_app/classes/data_base_create.dart';
import 'package:pautas_app/classes/shared_preferences_app.dart';
import 'package:pautas_app/store/controller_app.dart';
import 'package:pautas_app/views/home_view.dart';
import 'package:pautas_app/views/login_view.dart';
import 'package:provider/provider.dart';

import 'store/login_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesApp sharedPreferences = SharedPreferencesApp();
  await DatabaseCreate().initDatabase();
  await sharedPreferences.loadSharedPreferences();
  runApp(MyApp(sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferencesApp _sharedPreferencesApp;
  const MyApp(this._sharedPreferencesApp);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        title: 'UDSPautas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
        ),
        home: _sharedPreferencesApp.getUsuarioLogado == 0
            ? LoginView()
            : HomePageView(),
      ),
      providers: [
        Provider<ControllerAppStore>(
          create: (_) => ControllerAppStore(),
        ),
        Provider<LoginStore>(
          create: (_) => LoginStore(_sharedPreferencesApp),
        ),
        Provider<SharedPreferencesApp>(
          create: (_) => _sharedPreferencesApp,
        )
      ],
    );
  }
}
