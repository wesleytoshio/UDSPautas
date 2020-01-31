import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pautas_app/consts/font_styles_consts.dart';
import 'package:pautas_app/store/forgot_pass_store.dart';

class ForgotPassView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ForgotPassStore _forgotPassStore = ForgotPassStore();
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        Row(
                          children: <Widget>[
                            Text(
                              'Esqueceu sua',
                              style: FontStylesConsts.titleLogin,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'Senha',
                                  style: FontStylesConsts.titleLoginBoldUDS,
                                ),
                                Text(
                                  '?',
                                  style: FontStylesConsts.titleLoginBold,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Digite seu email no campo abaixo, para que possamos enviar sua senha.',
                          style: FontStylesConsts.hintStyleLogin,
                        ),
                        SizedBox(height: 40),
                        TextField(
                          onChanged: (value) {
                            _forgotPassStore.setEmail(value);
                          },
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: FontStylesConsts.hintStyleLogin,
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Enviar',
                              style: FontStylesConsts.subTitileLogin,
                            ),
                            InkWell(
                              child: Observer(
                                builder: (BuildContext context) {
                                  return AnimatedOpacity(
                                    duration: Duration(milliseconds: 200),
                                    opacity:
                                        _forgotPassStore.showButton ? 1 : 0,
                                    child: Container(
                                      height: 75,
                                      width: 75,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.black87,
                                        ),
                                        onPressed: () async {
                                          if (_forgotPassStore.showButton) {
                                            await _forgotPassStore.sendEmail();
                                            if (_forgotPassStore
                                                .message.isNotEmpty) {
                                              showToast(
                                                  _forgotPassStore.message,
                                                  position:
                                                      ToastPosition.bottom);
                                            }
                                          }
                                        },
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
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
