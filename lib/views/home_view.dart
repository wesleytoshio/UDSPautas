import 'package:flutter/material.dart';
import 'package:pautas_app/classes/shared_preferences_app.dart';
import 'package:pautas_app/views/login_view.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SharedPreferencesApp sharedPreferencesApp =
        Provider.of<SharedPreferencesApp>(context);
    return Scaffold(
      body: Center(
              child: RaisedButton(
          onPressed: () {
            sharedPreferencesApp.clearUsuarioLogado();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return LoginView();
            }));
          },
        ),
      ),
    );
  }
}
