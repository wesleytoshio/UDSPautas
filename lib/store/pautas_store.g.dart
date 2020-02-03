// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pautas_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PautasStore on _PautasStoreBase, Store {
  Computed<bool> _$showButtonComputed;

  @override
  bool get showButton =>
      (_$showButtonComputed ??= Computed<bool>(() => super.showButton)).value;
  Computed<String> _$ultimoExpComputed;

  @override
  String get ultimoExp =>
      (_$ultimoExpComputed ??= Computed<String>(() => super.ultimoExp)).value;

  final _$tituloAtom = Atom(name: '_PautasStoreBase.titulo');

  @override
  String get titulo {
    _$tituloAtom.context.enforceReadPolicy(_$tituloAtom);
    _$tituloAtom.reportObserved();
    return super.titulo;
  }

  @override
  set titulo(String value) {
    _$tituloAtom.context.conditionallyRunInAction(() {
      super.titulo = value;
      _$tituloAtom.reportChanged();
    }, _$tituloAtom, name: '${_$tituloAtom.name}_set');
  }

  final _$descricaoAtom = Atom(name: '_PautasStoreBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.context.enforceReadPolicy(_$descricaoAtom);
    _$descricaoAtom.reportObserved();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.context.conditionallyRunInAction(() {
      super.descricao = value;
      _$descricaoAtom.reportChanged();
    }, _$descricaoAtom, name: '${_$descricaoAtom.name}_set');
  }

  final _$detalhesAtom = Atom(name: '_PautasStoreBase.detalhes');

  @override
  String get detalhes {
    _$detalhesAtom.context.enforceReadPolicy(_$detalhesAtom);
    _$detalhesAtom.reportObserved();
    return super.detalhes;
  }

  @override
  set detalhes(String value) {
    _$detalhesAtom.context.conditionallyRunInAction(() {
      super.detalhes = value;
      _$detalhesAtom.reportChanged();
    }, _$detalhesAtom, name: '${_$detalhesAtom.name}_set');
  }

  final _$autorAtom = Atom(name: '_PautasStoreBase.autor');

  @override
  String get autor {
    _$autorAtom.context.enforceReadPolicy(_$autorAtom);
    _$autorAtom.reportObserved();
    return super.autor;
  }

  @override
  set autor(String value) {
    _$autorAtom.context.conditionallyRunInAction(() {
      super.autor = value;
      _$autorAtom.reportChanged();
    }, _$autorAtom, name: '${_$autorAtom.name}_set');
  }

  final _$messageAtom = Atom(name: '_PautasStoreBase.message');

  @override
  String get message {
    _$messageAtom.context.enforceReadPolicy(_$messageAtom);
    _$messageAtom.reportObserved();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.context.conditionallyRunInAction(() {
      super.message = value;
      _$messageAtom.reportChanged();
    }, _$messageAtom, name: '${_$messageAtom.name}_set');
  }

  final _$salvoAtom = Atom(name: '_PautasStoreBase.salvo');

  @override
  bool get salvo {
    _$salvoAtom.context.enforceReadPolicy(_$salvoAtom);
    _$salvoAtom.reportObserved();
    return super.salvo;
  }

  @override
  set salvo(bool value) {
    _$salvoAtom.context.conditionallyRunInAction(() {
      super.salvo = value;
      _$salvoAtom.reportChanged();
    }, _$salvoAtom, name: '${_$salvoAtom.name}_set');
  }

  final _$autorIdAtom = Atom(name: '_PautasStoreBase.autorId');

  @override
  String get autorId {
    _$autorIdAtom.context.enforceReadPolicy(_$autorIdAtom);
    _$autorIdAtom.reportObserved();
    return super.autorId;
  }

  @override
  set autorId(String value) {
    _$autorIdAtom.context.conditionallyRunInAction(() {
      super.autorId = value;
      _$autorIdAtom.reportChanged();
    }, _$autorIdAtom, name: '${_$autorIdAtom.name}_set');
  }

  final _$listPautasAbertasAtom =
      Atom(name: '_PautasStoreBase.listPautasAbertas');

  @override
  List<Pauta> get listPautasAbertas {
    _$listPautasAbertasAtom.context.enforceReadPolicy(_$listPautasAbertasAtom);
    _$listPautasAbertasAtom.reportObserved();
    return super.listPautasAbertas;
  }

  @override
  set listPautasAbertas(List<Pauta> value) {
    _$listPautasAbertasAtom.context.conditionallyRunInAction(() {
      super.listPautasAbertas = value;
      _$listPautasAbertasAtom.reportChanged();
    }, _$listPautasAbertasAtom, name: '${_$listPautasAbertasAtom.name}_set');
  }

  final _$listPautasFechadasAtom =
      Atom(name: '_PautasStoreBase.listPautasFechadas');

  @override
  List<Pauta> get listPautasFechadas {
    _$listPautasFechadasAtom.context
        .enforceReadPolicy(_$listPautasFechadasAtom);
    _$listPautasFechadasAtom.reportObserved();
    return super.listPautasFechadas;
  }

  @override
  set listPautasFechadas(List<Pauta> value) {
    _$listPautasFechadasAtom.context.conditionallyRunInAction(() {
      super.listPautasFechadas = value;
      _$listPautasFechadasAtom.reportChanged();
    }, _$listPautasFechadasAtom, name: '${_$listPautasFechadasAtom.name}_set');
  }

  final _$ultimoExpandidoAtom = Atom(name: '_PautasStoreBase.ultimoExpandido');

  @override
  String get ultimoExpandido {
    _$ultimoExpandidoAtom.context.enforceReadPolicy(_$ultimoExpandidoAtom);
    _$ultimoExpandidoAtom.reportObserved();
    return super.ultimoExpandido;
  }

  @override
  set ultimoExpandido(String value) {
    _$ultimoExpandidoAtom.context.conditionallyRunInAction(() {
      super.ultimoExpandido = value;
      _$ultimoExpandidoAtom.reportChanged();
    }, _$ultimoExpandidoAtom, name: '${_$ultimoExpandidoAtom.name}_set');
  }

  final _$pageIndexAtom = Atom(name: '_PautasStoreBase.pageIndex');

  @override
  int get pageIndex {
    _$pageIndexAtom.context.enforceReadPolicy(_$pageIndexAtom);
    _$pageIndexAtom.reportObserved();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.context.conditionallyRunInAction(() {
      super.pageIndex = value;
      _$pageIndexAtom.reportChanged();
    }, _$pageIndexAtom, name: '${_$pageIndexAtom.name}_set');
  }

  final _$updateStatusAsyncAction = AsyncAction('updateStatus');

  @override
  Future updateStatus(Pauta pauta, String novoStatus) {
    return _$updateStatusAsyncAction
        .run(() => super.updateStatus(pauta, novoStatus));
  }

  final _$deletePautaAsyncAction = AsyncAction('deletePauta');

  @override
  Future deletePauta(Pauta pauta) {
    return _$deletePautaAsyncAction.run(() => super.deletePauta(pauta));
  }

  final _$loadPautasAsyncAction = AsyncAction('loadPautas');

  @override
  Future<dynamic> loadPautas() {
    return _$loadPautasAsyncAction.run(() => super.loadPautas());
  }

  final _$addPautaAsyncAction = AsyncAction('addPauta');

  @override
  Future<dynamic> addPauta() {
    return _$addPautaAsyncAction.run(() => super.addPauta());
  }

  final _$_PautasStoreBaseActionController =
      ActionController(name: '_PautasStoreBase');

  @override
  dynamic setUltimoExpandido(String value) {
    final _$actionInfo = _$_PautasStoreBaseActionController.startAction();
    try {
      return super.setUltimoExpandido(value);
    } finally {
      _$_PautasStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPageIndex(int value) {
    final _$actionInfo = _$_PautasStoreBaseActionController.startAction();
    try {
      return super.setPageIndex(value);
    } finally {
      _$_PautasStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic listenPautas() {
    final _$actionInfo = _$_PautasStoreBaseActionController.startAction();
    try {
      return super.listenPautas();
    } finally {
      _$_PautasStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearPauta() {
    final _$actionInfo = _$_PautasStoreBaseActionController.startAction();
    try {
      return super.clearPauta();
    } finally {
      _$_PautasStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitulo(String titulo) {
    final _$actionInfo = _$_PautasStoreBaseActionController.startAction();
    try {
      return super.setTitulo(titulo);
    } finally {
      _$_PautasStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescricao(String descricao) {
    final _$actionInfo = _$_PautasStoreBaseActionController.startAction();
    try {
      return super.setDescricao(descricao);
    } finally {
      _$_PautasStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDetalhes(String detalhes) {
    final _$actionInfo = _$_PautasStoreBaseActionController.startAction();
    try {
      return super.setDetalhes(detalhes);
    } finally {
      _$_PautasStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAutor(String autor) {
    final _$actionInfo = _$_PautasStoreBaseActionController.startAction();
    try {
      return super.setAutor(autor);
    } finally {
      _$_PautasStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAutorId(String autorId) {
    final _$actionInfo = _$_PautasStoreBaseActionController.startAction();
    try {
      return super.setAutorId(autorId);
    } finally {
      _$_PautasStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
