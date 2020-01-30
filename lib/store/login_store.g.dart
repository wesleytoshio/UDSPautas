// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
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

  final _$lembrarmeEmailSenhaAtom =
      Atom(name: '_LoginStoreBase.lembrarmeEmailSenha');

  @override
  List<String> get lembrarmeEmailSenha {
    _$lembrarmeEmailSenhaAtom.context
        .enforceReadPolicy(_$lembrarmeEmailSenhaAtom);
    _$lembrarmeEmailSenhaAtom.reportObserved();
    return super.lembrarmeEmailSenha;
  }

  @override
  set lembrarmeEmailSenha(List<String> value) {
    _$lembrarmeEmailSenhaAtom.context.conditionallyRunInAction(() {
      super.lembrarmeEmailSenha = value;
      _$lembrarmeEmailSenhaAtom.reportChanged();
    }, _$lembrarmeEmailSenhaAtom,
        name: '${_$lembrarmeEmailSenhaAtom.name}_set');
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

  final _$loginAppAsyncAction = AsyncAction('loginApp');

  @override
  Future loginApp(String email, String senha) {
    return _$loginAppAsyncAction.run(() => super.loginApp(email, senha));
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  dynamic loadLembrarme() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.loadLembrarme();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLembrarme({bool lembrar, String email, String senha}) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.setLembrarme(lembrar: lembrar, email: email, senha: senha);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic showTextPass() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.showTextPass();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
