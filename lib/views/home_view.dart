import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:pautas_app/consts/font_styles_consts.dart';
import 'package:pautas_app/models/pauta_model.dart';
import 'package:pautas_app/store/login_store.dart';
import 'package:pautas_app/store/pautas_store.dart';
import 'package:pautas_app/views/add_pauta_view.dart';
import 'package:pautas_app/views/profile_view.dart';
import 'package:pautas_app/widgets/list_pautas.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  PautasStore _pautasStore;
  TabController _tabController;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();
    _pautasStore = GetIt.I<PautasStore>();
    _pautasStore.loadPautasAbertas();
    _pautasStore.loadPautasFechadas();
    _pautasStore.setUltimoExpandido('');
  }

  @override
  Widget build(BuildContext context) {
    LoginStore _loginStore = GetIt.I<LoginStore>();
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          margin: EdgeInsets.only(
            left: 20.0,
            right: 20,
            top: 60,
            bottom: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Olá, ',
                          style: FontStylesConsts.titleLogin,
                        ),
                      ],
                    ),
                    Flexible(
                      child: Text(
                        _loginStore.currentUser.nome,
                        style: FontStylesConsts.titleLoginBoldUDS,
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Tooltip(
                message: 'Atualizar',
                child: IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    _pautasStore.loadPautasAbertas();
                    _pautasStore.loadPautasFechadas();
                  },
                ),
              ),
              Tooltip(
                message: 'Meu Perfil',
                child: IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ProfileView();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(150),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Adicionar Pauta',
        child: Icon(Icons.add),
        onPressed: () async {
          String result = await Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return AddPautaView();
          }));
          if (result == 'Ok') {
            _pageController.jumpToPage(0);
            _tabController.animateTo(0);
            _pautasStore.setPageIndex(0);
  
          }
        },
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: DefaultTabController(
        length: 2,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Column(
            children: <Widget>[
              TabBar(
                onTap: (index) {
                  _pageController.jumpToPage(index);
                  _pautasStore.setPageIndex(index);
                },
                controller: _tabController,
                labelStyle: TextStyle(
                    fontFamily: 'Google', fontWeight: FontWeight.w700),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey[400],
                indicator: MD2Indicator(
                    indicatorHeight: 3,
                    indicatorColor: Colors.blue,
                    indicatorSize: MD2IndicatorSize.normal),
                tabs: <Widget>[
                  Tab(
                    text: "Pautas Abertas",
                  ),
                  Tab(
                    text: "Pautas Fechadas",
                  ),
                ],
              ),
              Observer(
                builder: (BuildContext context) {
                  List<Pauta> listAbertas = _pautasStore.listPautasAbertas;
                  List<Pauta> listFechadas = _pautasStore.listPautasFechadas;
                  return Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        _tabController.animateTo(index);
                        _pautasStore.setPageIndex(index);
                      },
                      children: <Widget>[
                        ListPautas(
                          index: 0,
                          list: listAbertas,
                        ),
                        ListPautas(
                          index: 1,
                          list: listFechadas,
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
