import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pautas_app/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'UDSPautas',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.dark,
            cursorColor: Colors.blue,
            textSelectionColor: Colors.blue,
            textSelectionHandleColor: Colors.blue,
            accentColor: Colors.blue),
        home: SplashView()
      ),
    );
  }
}
