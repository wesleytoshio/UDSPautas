// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pautas_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PautasStore on _PautasStoreBase, Store {
  Computed<int> _$ultimoExpComputed;

  @override
  int get ultimoExp =>
      (_$ultimoExpComputed ??= Computed<int>(() => super.ultimoExp)).value;

  final _$listPautasAtom = Atom(name: '_PautasStoreBase.listPautas');

  @override
  List<Pauta> get listPautas {
    _$listPautasAtom.context.enforceReadPolicy(_$listPautasAtom);
    _$listPautasAtom.reportObserved();
    return super.listPautas;
  }

  @override
  set listPautas(List<Pauta> value) {
    _$listPautasAtom.context.conditionallyRunInAction(() {
      super.listPautas = value;
      _$listPautasAtom.reportChanged();
    }, _$listPautasAtom, name: '${_$listPautasAtom.name}_set');
  }

  final _$ultimoExpandidoAtom = Atom(name: '_PautasStoreBase.ultimoExpandido');

  @override
  int get ultimoExpandido {
    _$ultimoExpandidoAtom.context.enforceReadPolicy(_$ultimoExpandidoAtom);
    _$ultimoExpandidoAtom.reportObserved();
    return super.ultimoExpandido;
  }

  @override
  set ultimoExpandido(int value) {
    _$ultimoExpandidoAtom.context.conditionallyRunInAction(() {
      super.ultimoExpandido = value;
      _$ultimoExpandidoAtom.reportChanged();
    }, _$ultimoExpandidoAtom, name: '${_$ultimoExpandidoAtom.name}_set');
  }

  final _$loadPautasAsyncAction = AsyncAction('loadPautas');

  @override
  Future<dynamic> loadPautas() {
    return _$loadPautasAsyncAction.run(() => super.loadPautas());
  }

  final _$_PautasStoreBaseActionController =
      ActionController(name: '_PautasStoreBase');

  @override
  dynamic setUltimoExpandido(int value) {
    final _$actionInfo = _$_PautasStoreBaseActionController.startAction();
    try {
      return super.setUltimoExpandido(value);
    } finally {
      _$_PautasStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
