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

  final _$loginAppAsyncAction = AsyncAction('loginApp');

  @override
  Future<RetornoApp> loginApp(String email, String senha) {
    return _$loginAppAsyncAction.run(() => super.loginApp(email, senha));
  }
}
