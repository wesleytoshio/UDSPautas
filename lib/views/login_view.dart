import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pautas_app/consts/font_styles_consts.dart';
import 'package:pautas_app/store/login_store.dart';
import 'package:pautas_app/views/forgot_pass_view.dart';
import 'package:pautas_app/views/home_view.dart';
import 'package:pautas_app/views/register_view.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  FocusNode focoSenha;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  @override
  void initState() {
    super.initState();
    focoSenha = FocusNode();
  }

  @override
  void dispose() {
    focoSenha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginStore _loginStore = Provider.of<LoginStore>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 120.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Bem vindo ao,',
                              style: FontStylesConsts.titleLogin,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'UDS',
                                  style: FontStylesConsts.titleLoginBoldUDS,
                                ),
                                Text(
                                  'Pautas',
                                  style: FontStylesConsts.titleLoginBold,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 100),
                        TextField(
                          autofocus: false,
                          textInputAction: TextInputAction.go,
                          keyboardType: TextInputType.emailAddress,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(focoSenha);
                          },
                          controller: controllerEmail,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: FontStylesConsts.hintStyleLogin,
                          ),
                        ),
                        SizedBox(height: 30),
                        TextField(
                          autofocus: false,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          focusNode: focoSenha,
                          controller: controllerSenha,
                          decoration: InputDecoration(
                            hintText: 'Senha',
                            hintStyle: FontStylesConsts.hintStyleLogin,
                          ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Entrar',
                              style: FontStylesConsts.subTitileLogin,
                            ),
                            InkWell(
                              child: Observer(
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 75,
                                    width: 75,
                                    child: IconButton(
                                      icon: !_loginStore.logando
                                          ? Icon(
                                              Icons.arrow_forward,
                                              color: Colors.blue,
                                            )
                                          : Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                      onPressed: () {
                                        _loginStore.loginApp(
                                            controllerEmail.text,
                                            controllerSenha.text);
                                        
                                        when((_) => _loginStore.message.isNotEmpty,
                                            () {
                                          showToast(_loginStore.message,
                                              position: ToastPosition.bottom);
                                        });

                                        when((_) => (_loginStore.logado == true && _loginStore.currentUser != null),
                                            () {
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return HomeView();
                                          }));
                                        });
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return RegisterView();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Registrar-se',
                                style: FontStylesConsts.labelsLogin,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ForgotPassView();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Esqueci minha Senha',
                                style: FontStylesConsts.labelsLogin,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
