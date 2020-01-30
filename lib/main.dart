import 'package:flutter/material.dart';
import 'package:pautas_app/classes/data_base_create.dart';
import 'package:pautas_app/classes/shared_preferences_app.dart';
import 'package:pautas_app/store/controller_app.dart';
import 'package:pautas_app/store/login_store.dart';
import 'package:pautas_app/views/home_view.dart';
import 'package:pautas_app/views/login_view.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseCreate().initDatabase();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LoginStore loginStore;
  @override
  void initState() {
    super.initState();
    loginStore = LoginStore();
    loginStore.loadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        title: 'UDSPautas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: ThemeData.dark().primaryColor,
            primarySwatch: Colors.blue),
        home: loginStore.idUsuLogado == 0 ? LoginView() : HomePageView(),
      ),
      providers: [
        Provider<ControllerAppStore>(
          create: (_) => ControllerAppStore(),
        ),
        Provider<SharedPreferencesApp>(
          create: (_) => SharedPreferencesApp(),
        )
      ],
    );
  }
}
