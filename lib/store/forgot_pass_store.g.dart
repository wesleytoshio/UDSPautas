// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_pass_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotPassStore on _ForgotPassStoreBase, Store {
  Computed<bool> _$showButtonComputed;

  @override
  bool get showButton =>
      (_$showButtonComputed ??= Computed<bool>(() => super.showButton)).value;

  final _$emailAtom = Atom(name: '_ForgotPassStoreBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$enviandoAtom = Atom(name: '_ForgotPassStoreBase.enviando');

  @override
  bool get enviando {
    _$enviandoAtom.context.enforceReadPolicy(_$enviandoAtom);
    _$enviandoAtom.reportObserved();
    return super.enviando;
  }

  @override
  set enviando(bool value) {
    _$enviandoAtom.context.conditionallyRunInAction(() {
      super.enviando = value;
      _$enviandoAtom.reportChanged();
    }, _$enviandoAtom, name: '${_$enviandoAtom.name}_set');
  }

  final _$messageAtom = Atom(name: '_ForgotPassStoreBase.message');

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

  final _$_ForgotPassStoreBaseActionController =
      ActionController(name: '_ForgotPassStoreBase');

  @override
  dynamic setEmail(String aEmail) {
    final _$actionInfo = _$_ForgotPassStoreBaseActionController.startAction();
    try {
      return super.setEmail(aEmail);
    } finally {
      _$_ForgotPassStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
