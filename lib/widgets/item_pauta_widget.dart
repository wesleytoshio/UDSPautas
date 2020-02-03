import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:groovin_widgets/groovin_expansion_tile.dart';
import 'package:pautas_app/consts/font_styles_consts.dart';
import 'package:pautas_app/models/pauta_model.dart';
import 'package:pautas_app/store/pautas_store.dart';

class ItemPauta extends StatefulWidget {
  final Pauta pauta;
  final int index;
  final ValueChanged<bool> onExpanded;

  ItemPauta({this.pauta, this.index, this.onExpanded});

  @override
  _ItemPautaState createState() => _ItemPautaState();
}

class _ItemPautaState extends State<ItemPauta> {
  PautasStore _pautasStore = GetIt.I<PautasStore>();

  @override
  Widget build(BuildContext context) {
    Pauta pauta = this.widget.pauta;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[800], borderRadius: BorderRadius.circular(10)),
        child: GroovinExpansionTile(
          subtitle: Text(
            pauta.descricao,
            style: FontStylesConsts.descriptiontemPauta,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          onExpansionChanged: this.widget.onExpanded,

          initiallyExpanded:
              _pautasStore.ultimoExp == this.widget.pauta.documentId()
                  ? true
                  : false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(pauta.titulo, style: FontStylesConsts.titleItemPauta),
            ],
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    pauta.detalhes,
                    style: FontStylesConsts.descriptiontemPauta,
                    softWrap: true,
                    maxLines: 7,
                    overflow: TextOverflow.fade,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    pauta.autorNome,
                    style: FontStylesConsts.autorCardStyle,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RaisedButton(
                      elevation: 0,
                      color: pauta.status == 'A' ? Colors.red: Colors.blue, 
                      child:
                          Text(pauta.status == 'A' ? 'Fechar' : 'Reabrir'),
                      onPressed: () {
                        _pautasStore.updateStatus(pauta, pauta.status == 'A' ? 'F' : 'A');
                        _pautasStore.loadPautasAbertas();
                        _pautasStore.loadPautasFechadas(); 
                        _pautasStore.setUltimoExpandido(''); 
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
