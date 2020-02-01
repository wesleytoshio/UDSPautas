import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:groovin_widgets/groovin_expansion_tile.dart';
import 'package:pautas_app/consts/font_styles_consts.dart';
import 'package:pautas_app/models/pauta_model.dart';
import 'package:pautas_app/store/pautas_store.dart';

class ItemPauta extends StatelessWidget {
  Pauta pauta;
  int index;
  final ValueChanged<bool> onExpanded;

  ItemPauta({this.pauta, this.index, this.onExpanded});

  PautasStore _pautasStore = GetIt.I<PautasStore>();
  @override
  Widget build(BuildContext context) {
    Pauta pauta = this.pauta;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[800], borderRadius: BorderRadius.circular(10)),
        child: GroovinExpansionTile(
          onExpansionChanged: this.onExpanded,
          initiallyExpanded: _pautasStore.ultimoExp == this.index ? true: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(pauta.titulo, style: FontStylesConsts.titleItemPauta),
              Text(
                pauta.descricao,
                style: FontStylesConsts.descriptiontemPauta,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
    /*GestureDetector(
      onTap: () {
        setState(() {
          if (pauta.expanded) {
            if (_listPauta.ultimoIndexExpadido != widget.index) {
              _listPauta.recolheExpandidos();
            }
            _listPauta.ultimoIndexExpadido = widget.index;
          }
          pauta.expanded = !pauta.expanded;
        });
      },
      child: AnimatedContainer(
        curve: Curves.easeOutCubic,
        height: pauta.expanded
            ? MediaQuery.of(context).size.height / 3
            : MediaQuery.of(context).size.height / 8,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[800]),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(pauta.titulo, style: FontStylesConsts.titleItemPauta),
                  InkWell(
                    child: pauta.expanded
                        ? Icon(Icons.keyboard_arrow_up)
                        : Icon(Icons.keyboard_arrow_down),
                    onTap: () {
                      setState(() {
                        if (pauta.expanded) {
                          if (_listPauta.ultimoIndexExpadido != widget.index) {
                            _listPauta.recolheExpandidos();
                          }
                          _listPauta.ultimoIndexExpadido = widget.index;
                        }
                        pauta.expanded = !pauta.expanded;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                pauta.descricao,
                style: FontStylesConsts.descriptiontemPauta,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              AnimatedContainer(
                height: pauta.expanded ? 10 : 0,
                duration: Duration(milliseconds: 200),
              ),
              Flexible(
                child: AnimatedOpacity(
                  child: Text(
                    pauta.detalhes,
                    style: FontStylesConsts.descriptiontemPauta,
                    softWrap: true,
                    maxLines: 7,
                    overflow: TextOverflow.fade,
                  ),
                  duration: Duration(milliseconds: 100),
                  opacity: pauta.expanded ? 1 : 0,
                ),
              ),
              AnimatedContainer(
                height: pauta.expanded ? 10 : 0,
                duration: Duration(milliseconds: 200),
              ),
              Flexible(
                  child: AnimatedOpacity(
                duration: Duration(milliseconds: 100),
                opacity: pauta.expanded ? 1 : 0,
                child: Text(
                  pauta.autorNome,
                  style: FontStylesConsts.autorCardStyle,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
            ],
          ),
        ),
        duration: Duration(milliseconds: 300),
      ),
    );*/
  }
}
