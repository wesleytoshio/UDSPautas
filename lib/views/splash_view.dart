import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pautas_app/consts/font_styles_consts.dart';
import 'package:pautas_app/store/splash_store.dart';
import 'package:pautas_app/views/home_view.dart';
import 'package:pautas_app/views/login_view.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  SplashStore _splashStore;
  @override
  void initState() {
    super.initState();
    _splashStore = SplashStore();
    _splashStore.loadInstancesAndAuth();
  }

  @override
  Widget build(BuildContext context) {
    reaction((_) => _splashStore.autenticado, (_) {
      if (_splashStore.autenticado == false) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return LoginView();
        }));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return HomeView();
        }));
      }
    });
    return Scaffold(
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('UD', style: FontStylesConsts.titleSplachScreenBoldUDS),
              Text(
                'S',
                style: FontStylesConsts.titleSplachScreenBoldUDS,
              ),
              Text(
                'Pautas',
                style: FontStylesConsts.titleSplachScreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
