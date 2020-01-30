// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$remembermeListAtom = Atom(name: '_LoginStoreBase.remembermeList');

  @override
  List<String> get remembermeList {
    _$remembermeListAtom.context.enforceReadPolicy(_$remembermeListAtom);
    _$remembermeListAtom.reportObserved();
    return super.remembermeList;
  }

  @override
  set remembermeList(List<String> value) {
    _$remembermeListAtom.context.conditionallyRunInAction(() {
      super.remembermeList = value;
      _$remembermeListAtom.reportChanged();
    }, _$remembermeListAtom, name: '${_$remembermeListAtom.name}_set');
  }

  final _$lembrarmeAtom = Atom(name: '_LoginStoreBase.lembrarme');

  @override
  bool get lembrarme {
    _$lembrarmeAtom.context.enforceReadPolicy(_$lembrarmeAtom);
    _$lembrarmeAtom.reportObserved();
    return super.lembrarme;
  }

  @override
  set lembrarme(bool value) {
    _$lembrarmeAtom.context.conditionallyRunInAction(() {
      super.lembrarme = value;
      _$lembrarmeAtom.reportChanged();
    }, _$lembrarmeAtom, name: '${_$lembrarmeAtom.name}_set');
  }

  final _$messageAtom = Atom(name: '_LoginStoreBase.message');

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

  final _$usuarioAtom = Atom(name: '_LoginStoreBase.usuario');

  @override
  Usuario get usuario {
    _$usuarioAtom.context.enforceReadPolicy(_$usuarioAtom);
    _$usuarioAtom.reportObserved();
    return super.usuario;
  }

  @override
  set usuario(Usuario value) {
    _$usuarioAtom.context.conditionallyRunInAction(() {
      super.usuario = value;
      _$usuarioAtom.reportChanged();
    }, _$usuarioAtom, name: '${_$usuarioAtom.name}_set');
  }

  final _$idUsuLogadoAtom = Atom(name: '_LoginStoreBase.idUsuLogado');

  @override
  int get idUsuLogado {
    _$idUsuLogadoAtom.context.enforceReadPolicy(_$idUsuLogadoAtom);
    _$idUsuLogadoAtom.reportObserved();
    return super.idUsuLogado;
  }

  @override
  set idUsuLogado(int value) {
    _$idUsuLogadoAtom.context.conditionallyRunInAction(() {
      super.idUsuLogado = value;
      _$idUsuLogadoAtom.reportChanged();
    }, _$idUsuLogadoAtom, name: '${_$idUsuLogadoAtom.name}_set');
  }

  final _$showTextAtom = Atom(name: '_LoginStoreBase.showText');

  @override
  bool get showText {
    _$showTextAtom.context.enforceReadPolicy(_$showTextAtom);
    _$showTextAtom.reportObserved();
    return super.showText;
  }

  @override
  set showText(bool value) {
    _$showTextAtom.context.conditionallyRunInAction(() {
      super.showText = value;
      _$showTextAtom.reportChanged();
    }, _$showTextAtom, name: '${_$showTextAtom.name}_set');
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  dynamic showTextPass() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.showTextPass();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic loginApp(Usuario usuario) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.loginApp(usuario);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLembrarme(bool check) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.setLembrarme(check);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic loadPreferences() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.loadPreferences();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
