// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashStore on _SplashStoreBase, Store {
  final _$autenticadoAtom = Atom(name: '_SplashStoreBase.autenticado');

  @override
  bool get autenticado {
    _$autenticadoAtom.context.enforceReadPolicy(_$autenticadoAtom);
    _$autenticadoAtom.reportObserved();
    return super.autenticado;
  }

  @override
  set autenticado(bool value) {
    _$autenticadoAtom.context.conditionallyRunInAction(() {
      super.autenticado = value;
      _$autenticadoAtom.reportChanged();
    }, _$autenticadoAtom, name: '${_$autenticadoAtom.name}_set');
  }

  final _$loadInstancesAndAuthAsyncAction = AsyncAction('loadInstancesAndAuth');

  @override
  Future loadInstancesAndAuth() {
    return _$loadInstancesAndAuthAsyncAction
        .run(() => super.loadInstancesAndAuth());
  }
}
