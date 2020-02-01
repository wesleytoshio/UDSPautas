import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';

import 'package:pautas_app/consts/font_styles_consts.dart';

import 'package:pautas_app/store/login_store.dart';
import 'package:pautas_app/views/login_view.dart';

import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginStore _loginStore = Provider.of<LoginStore>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          margin: EdgeInsets.only(
            left: 20.0,
            right: 20,
            top: 60,
            bottom: 30,
          ),
          child: Container(
                      child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
            Flexible(
              child: Text(
                _loginStore.currentUser.nome,
                style: FontStylesConsts.titleLoginBoldUDS,
                softWrap: true,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              _loginStore.currentUser.email,
              style: FontStylesConsts.hintStyleLogin,
            ),
            SizedBox(height: 100,),
            Center(
              child: InkWell(
                child: Container(
                  height: 75,
                  width: 75,
                  child: IconButton(
                    icon: Icon(
                            Icons.exit_to_app,
                            color: Colors.blue,
                          ),
                    onPressed: () async {
                      await _loginStore.logoutApp();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(
                              builder: (BuildContext context) {
                        return LoginView();
                      }));
                    },
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
              ),
            ),
                      ],
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
