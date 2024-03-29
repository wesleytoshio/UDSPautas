import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pautas_app/consts/font_styles_consts.dart';
import 'package:pautas_app/store/register_store.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  FocusNode focoEmail;
  FocusNode focoSenha;
  RegisterStore _registerStore = RegisterStore();

  @override
  void initState() {
    super.initState();
    focoEmail = FocusNode();
    focoSenha = FocusNode();
  }

  @override
  void dispose() {
    focoEmail.dispose();
    focoSenha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 60,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 60,
                          child: InkWell(
                            child: Icon(Icons.arrow_back),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'Criar conta',
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
                            SizedBox(height: 40),
                            TextField(
                              onChanged: (nome) {
                                _registerStore.setNome(nome);
                              },
                              textInputAction: TextInputAction.go,
                              keyboardType: TextInputType.text,
                              onSubmitted: (value) {
                                FocusScope.of(context).requestFocus(focoEmail);
                              },
                              decoration: InputDecoration(
                                hintText: 'Nome',
                                hintStyle: FontStylesConsts.hintStyleLogin,
                              ),
                            ),
                            SizedBox(height: 30),
                            TextField(
                              onChanged: (email) {
                                _registerStore.setEmail(email);
                              },
                              focusNode: focoEmail,
                              textInputAction: TextInputAction.go,
                              keyboardType: TextInputType.emailAddress,
                              onSubmitted: (value) {
                                FocusScope.of(context).requestFocus(focoSenha);
                              },
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: FontStylesConsts.hintStyleLogin,
                              ),
                            ),
                            SizedBox(height: 30),
                            TextField(
                              onChanged: (senha) {
                                _registerStore.setSenha(senha);
                              },
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              focusNode: focoSenha,
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
                                  'Registrar-se',
                                  style: FontStylesConsts.subTitileLogin,
                                ),
                                InkWell(
                                  child: Observer(
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 75,
                                        width: 75,
                                        child: IconButton(
                                          icon: !_registerStore.registrando
                                              ? Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.white,
                                                )
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        new AlwaysStoppedAnimation<
                                                                Color>(
                                                            Colors.white),
                                                  ),
                                                ),
                                          onPressed: () async {
                                            await _registerStore.newUsuario();
                                            if (_registerStore
                                                .message.isNotEmpty) {
                                              showToast(_registerStore.message,
                                                  position:
                                                      ToastPosition.bottom);
                                            }
                                            if (_registerStore.registrado) {
                                              Navigator.pop(context);
                                            }
                                          },
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
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
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Entrar',
                                    style: FontStylesConsts.labelsLogin,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
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
