import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pautas_app/consts/font_styles_consts.dart';
import 'package:pautas_app/models/pauta_model.dart';
import 'package:pautas_app/store/pautas_store.dart';
import 'package:pautas_app/widgets/item_pauta_widget.dart';

class ListPautas extends StatelessWidget {
  const ListPautas({Key key, this.index, this.list}) : super(key: key);

  final int index;
  final List<Pauta> list;

  @override
  Widget build(BuildContext context) {
    PautasStore _pautasStore = GetIt.I<PautasStore>();
    //List<Pauta> list = index == 0 ? _pautasStore.listPautasAbertas : _pautasStore.listPautasFechadas; 
    if (list != null) {
      if (list.length != 0) {
        return Observer(
          builder: (BuildContext context) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: list.length,
              key: Key(_pautasStore.ultimoExpandido),
              itemBuilder: (BuildContext context, int index) {
                return ItemPauta(
                  pauta: list[index],
                  index: index,
                  onExpanded: (value) {
                    if (value) {
                      _pautasStore.setUltimoExpandido(list[index].documentId());
                    } else {
                      _pautasStore.setUltimoExpandido('');
                    }
                  },
                );
              },
            );
          },
        );
      } else {
        return Container(
          child: Center(
              child: Text(
            index == 0
                ? 'Não existem pautas abertas'
                : 'Não existem pautas fechadas',
            style: FontStylesConsts.hintStyleLogin,
          )),
        );
      }
    } else {
      return Container(
          child: Center(
        child: CircularProgressIndicator(),
      ));
    }
  }
}
