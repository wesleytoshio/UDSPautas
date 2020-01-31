import 'package:flutter/material.dart';
import 'package:pautas_app/classes/shared_preferences_app.dart';
import 'package:pautas_app/models/usuario_model.dart';
import 'package:pautas_app/store/login_store.dart';
import 'package:provider/provider.dart';

class HomeControllView extends StatefulWidget {

  @override
  _HomeControllViewState createState() => _HomeControllViewState();
}

class _HomeControllViewState extends State<HomeControllView> {
  Usuario _usuSalvo;

  @override
  void initState() {
    LoginStore _loginStore = Provider.of<LoginStore>(context);
    SharedPreferencesApp _sharedPreferencesApp = Provider.of<SharedPreferencesApp>(context);
    Usuario usuSalvo = _sharedPreferencesApp.getCredenciaisLogado;
    if (usuSalvo == null) {
    } else {
      _loginStore.loginApp(usuSalvo.email, usuSalvo.senha);   
    }
       super.initState();

  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

    
}