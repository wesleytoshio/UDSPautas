import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pautas_app/models/pauta_model.dart';
import 'package:pautas_app/store/pautas_store.dart';
import 'package:pautas_app/widgets/item_pauta_widget.dart';

class ListPautas extends StatelessWidget {
  final List<Pauta> list;
  final ValueChanged<bool> onExpanded;

  const ListPautas({Key key, this.list, this.onExpanded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PautasStore _pautasStore = GetIt.I<PautasStore>();
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemPauta(
          pauta: list[index],
          index: index,
          onExpanded: (value) {
            if (value) {
              _pautasStore.setUltimoExpandido(index);
            } else {
              _pautasStore.setUltimoExpandido(-1);
            }
          },
        );
      },
    );
  }
}
