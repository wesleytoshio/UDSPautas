// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on _RegisterStoreBase, Store {
  Computed<bool> _$exibirBotaoComputed;

  @override
  bool get exibirBotao =>
      (_$exibirBotaoComputed ??= Computed<bool>(() => super.exibirBotao)).value;

  final _$nomeAtom = Atom(name: '_RegisterStoreBase.nome');

  @override
  String get nome {
    _$nomeAtom.context.enforceReadPolicy(_$nomeAtom);
    _$nomeAtom.reportObserved();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.context.conditionallyRunInAction(() {
      super.nome = value;
      _$nomeAtom.reportChanged();
    }, _$nomeAtom, name: '${_$nomeAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_RegisterStoreBase.email');

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

  final _$senhaAtom = Atom(name: '_RegisterStoreBase.senha');

  @override
  String get senha {
    _$senhaAtom.context.enforceReadPolicy(_$senhaAtom);
    _$senhaAtom.reportObserved();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.context.conditionallyRunInAction(() {
      super.senha = value;
      _$senhaAtom.reportChanged();
    }, _$senhaAtom, name: '${_$senhaAtom.name}_set');
  }

  final _$messageAtom = Atom(name: '_RegisterStoreBase.message');

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

  final _$registradoAtom = Atom(name: '_RegisterStoreBase.registrado');

  @override
  bool get registrado {
    _$registradoAtom.context.enforceReadPolicy(_$registradoAtom);
    _$registradoAtom.reportObserved();
    return super.registrado;
  }

  @override
  set registrado(bool value) {
    _$registradoAtom.context.conditionallyRunInAction(() {
      super.registrado = value;
      _$registradoAtom.reportChanged();
    }, _$registradoAtom, name: '${_$registradoAtom.name}_set');
  }

  final _$registrandoAtom = Atom(name: '_RegisterStoreBase.registrando');

  @override
  bool get registrando {
    _$registrandoAtom.context.enforceReadPolicy(_$registrandoAtom);
    _$registrandoAtom.reportObserved();
    return super.registrando;
  }

  @override
  set registrando(bool value) {
    _$registrandoAtom.context.conditionallyRunInAction(() {
      super.registrando = value;
      _$registrandoAtom.reportChanged();
    }, _$registrandoAtom, name: '${_$registrandoAtom.name}_set');
  }

  final _$newUsuarioAsyncAction = AsyncAction('newUsuario');

  @override
  Future newUsuario() {
    return _$newUsuarioAsyncAction.run(() => super.newUsuario());
  }

  final _$_RegisterStoreBaseActionController =
      ActionController(name: '_RegisterStoreBase');

  @override
  dynamic setNome(String aNome) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction();
    try {
      return super.setNome(aNome);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String aEmail) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction();
    try {
      return super.setEmail(aEmail);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSenha(String aSenha) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction();
    try {
      return super.setSenha(aSenha);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
