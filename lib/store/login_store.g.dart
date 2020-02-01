// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$currentUserAtom = Atom(name: '_LoginStoreBase.currentUser');

  @override
  Usuario get currentUser {
    _$currentUserAtom.context.enforceReadPolicy(_$currentUserAtom);
    _$currentUserAtom.reportObserved();
    return super.currentUser;
  }

  @override
  set currentUser(Usuario value) {
    _$currentUserAtom.context.conditionallyRunInAction(() {
      super.currentUser = value;
      _$currentUserAtom.reportChanged();
    }, _$currentUserAtom, name: '${_$currentUserAtom.name}_set');
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

  final _$logadoAtom = Atom(name: '_LoginStoreBase.logado');

  @override
  bool get logado {
    _$logadoAtom.context.enforceReadPolicy(_$logadoAtom);
    _$logadoAtom.reportObserved();
    return super.logado;
  }

  @override
  set logado(bool value) {
    _$logadoAtom.context.conditionallyRunInAction(() {
      super.logado = value;
      _$logadoAtom.reportChanged();
    }, _$logadoAtom, name: '${_$logadoAtom.name}_set');
  }

  final _$logandoAtom = Atom(name: '_LoginStoreBase.logando');

  @override
  bool get logando {
    _$logandoAtom.context.enforceReadPolicy(_$logandoAtom);
    _$logandoAtom.reportObserved();
    return super.logando;
  }

  @override
  set logando(bool value) {
    _$logandoAtom.context.conditionallyRunInAction(() {
      super.logando = value;
      _$logandoAtom.reportChanged();
    }, _$logandoAtom, name: '${_$logandoAtom.name}_set');
  }

  final _$logoutAppAsyncAction = AsyncAction('logoutApp');

  @override
  Future<RetornoApp> logoutApp() {
    return _$logoutAppAsyncAction.run(() => super.logoutApp());
  }

  final _$loginAppAsyncAction = AsyncAction('loginApp');

  @override
  Future<RetornoApp> loginApp(String email, String senha) {
    return _$loginAppAsyncAction.run(() => super.loginApp(email, senha));
  }
}
