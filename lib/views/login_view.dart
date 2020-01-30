import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pautas_app/consts/style_consts.dart';
import 'package:pautas_app/store/login_store.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import '../store/login_store.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  FocusNode myFocusNode;
  TextEditingController controllerTextEmail = TextEditingController();
  TextEditingController controllerTextSenha = TextEditingController();

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();

    super.dispose();
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          //decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: controllerTextEmail,
            onSubmitted: (texto) =>
                FocusScope.of(context).requestFocus(myFocusNode),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Google',
              fontSize: 18,
            ),
            decoration: InputDecoration(
              //border: InputBorder.none,
              //contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'Digite seu email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF(LoginStore _loginStore) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: Observer(builder: (context) {
            return TextField(
              controller: controllerTextSenha,
              focusNode: myFocusNode,
              obscureText: _loginStore.showText,
              style: TextStyle(
                color: Colors.black87,
                fontFamily: 'Google',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: IconButton(
                  icon: Icon(
                    _loginStore.showText
                        ? Icons.remove_red_eye
                        : Icons.visibility_off,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    _loginStore.showTextPass();
                  },
                ),
                hintText: 'Digite sua senha',
                hintStyle: kHintTextStyle,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildRememberMeCheckbox(LoginStore _loginStore) {
    return Container(
      height: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: Observer(
                  builder: (BuildContext context) {
                    return InkWell(
                      child: Checkbox(
                        value: _loginStore.lembrarme == null
                            ? false
                            : _loginStore.lembrarme,
                        checkColor: Theme.of(context).primaryColor,
                        activeColor: Colors.white,
                        onChanged: (value) {
                          _loginStore.setLembrarme(
                              lembrar: value, email: '', senha: '');
                        },
                      ),
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  _loginStore.setLembrarme(
                      lembrar: !_loginStore.lembrarme, email: '', senha: '');
                },
                child: Text(
                  'Lembrar-me',
                  style: kLabelStyle,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              child: Text(
                'Esqueceu sua senha?',
                style: kLabelStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn(LoginStore _loginStore) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          _loginStore.loginApp(
              controllerTextEmail.text, controllerTextSenha.text);
          Toast.show(_loginStore.message, context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: Colors.blue,
        child: Text(
          'Entrar',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Google',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    LoginStore _loginStore = Provider.of<LoginStore>(context);
    _loginStore.loadLembrarme();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Bem vindo ao,', style: TextStyle(fontSize: 38, color: Colors.white, fontFamily: 'Google'),),
                        Text('UDSPautas', style: TextStyle(fontSize: 38, color: Colors.blue, fontFamily: 'Google', fontWeight: FontWeight.bold)),
                        SizedBox(height: 40),
                        _buildEmailTF(),
                        /*SizedBox(
                          height: 10.0,
                        ),
                        _buildPasswordTF(_loginStore),
                        SizedBox(
                          height: 15,
                        ),
                        _buildRememberMeCheckbox(_loginStore),
                        _buildLoginBtn(_loginStore),*/
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
