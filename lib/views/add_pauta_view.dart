import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pautas_app/consts/font_styles_consts.dart';
import 'package:pautas_app/store/login_store.dart';
import 'package:pautas_app/store/pautas_store.dart';

class AddPautaView extends StatefulWidget {
  @override
  _AddPautaViewState createState() => _AddPautaViewState();
}

class _AddPautaViewState extends State<AddPautaView> {
  FocusNode focoDescricao;
  FocusNode focoDetalhes;
  PautasStore _pautasStore;
  LoginStore _loginStore;

  @override
  void initState() {
    super.initState();
    _loginStore = GetIt.I<LoginStore>();
    _pautasStore = GetIt.I<PautasStore>();
    _pautasStore.clearPauta();
    _pautasStore.setAutor(_loginStore.currentUser.nome);
    _pautasStore.setAutorId(_loginStore.currentUser.uidUsu);
    focoDescricao = FocusNode();
    focoDetalhes = FocusNode();
  }

  @override
  void dispose() {
    focoDescricao.dispose();
    focoDetalhes.dispose();
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
                                  'Criar',
                                  style: FontStylesConsts.titleLogin,
                                ),
                                Text(
                                  'Pauta',
                                  style: FontStylesConsts.titleLoginBoldUDS,
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            TextField(
                              onChanged: (titulo) {
                                _pautasStore.setTitulo(titulo);
                              },
                              textInputAction: TextInputAction.go,
                              keyboardType: TextInputType.text,
                              onSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(focoDescricao);
                              },
                              decoration: InputDecoration(
                                labelText: 'Título',
                                hintText: 'Informe um Título',
                                labelStyle: FontStylesConsts.hintStyleLogin,
                                hintStyle: FontStylesConsts.hintStyleLogin,
                              ),
                            ),
                            SizedBox(height: 30),
                            TextField(
                              onChanged: (descricao) {
                                _pautasStore.setDescricao(descricao);
                              },
                              focusNode: focoDescricao,
                              textInputAction: TextInputAction.go,
                              keyboardType: TextInputType.emailAddress,
                              onSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(focoDetalhes);
                              },
                              decoration: InputDecoration(
                                labelText: 'Descrição',
                                hintText: 'Informe a Descrição',
                                hintStyle: FontStylesConsts.hintStyleLogin,
                                labelStyle: FontStylesConsts.hintStyleLogin,
                              ),
                            ),
                            SizedBox(height: 30),
                            TextField(
                              onChanged: (detalhes) {
                                _pautasStore.setDetalhes(detalhes);
                              },
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              focusNode: focoDetalhes,
                              decoration: InputDecoration(
                                labelText: 'Detalhes',
                                hintText: 'Informe os Detalhes',
                                labelStyle: FontStylesConsts.hintStyleLogin,
                                hintStyle: FontStylesConsts.hintStyleLogin,
                              ),
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Adicionar',
                                  style: FontStylesConsts.subTitileLogin,
                                ),
                                InkWell(
                                  child: Observer(
                                    name: 'addPauta',
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 75,
                                        width: 75,
                                        child: IconButton(
                                            icon: Icon(
                                              Icons.done,
                                              color: Colors.white,
                                            ),
                                            onPressed: _pautasStore.showButton
                                                ? () async {
                                                    await _pautasStore
                                                        .addPauta();
                                                    if (_pautasStore
                                                        .message.isNotEmpty) {
                                                      showToast(
                                                          _pautasStore.message,
                                                          position:
                                                              ToastPosition
                                                                  .bottom);
                                                    }
                                                    if (_pautasStore.salvo) {
                                                      _pautasStore
                                                          .setPageIndex(0);
                                                      Navigator.pop(
                                                          context, 'Ok');
                                                    }
                                                  }
                                                : null),
                                        decoration: BoxDecoration(
                                            color: _pautasStore.showButton
                                                ? Colors.blue
                                                : Colors.grey,
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
