import 'package:mobx/mobx.dart';
import 'package:pautas_app/consts/messages_consts.dart';
import 'package:pautas_app/repository/repository_usuarios.dart';
import 'package:flutter/services.dart';
part 'forgot_pass_store.g.dart';

class ForgotPassStore = _ForgotPassStoreBase with _$ForgotPassStore;

abstract class _ForgotPassStoreBase with Store {
  @observable
  String email = '';

  @observable
  bool enviando = false;

  @observable
  String message;

  @computed
  bool get showButton => email.isNotEmpty;

  @action
  setEmail(String aEmail) {
    email = aEmail;
  }

  Future<void> resetPassword(String email) async {
    message = '';
    if (email.isNotEmpty) {
      try {
        enviando = true;
        await RepositoryUsuarios.resetPassword(email.trim());
        enviando = false;
        message = MessagesConsts.senhaRedefinicaoOk;
      } on PlatformException catch (e) {
        enviando = false;
        if (e.code == MessagesConsts.authErrorEmailInvaido) {
          message = MessagesConsts.emailInvalido;
        } else if (e.code == MessagesConsts.authErrorEmailNaoExiste) {
          message = MessagesConsts.emailIncorreto;
        }
      }
    } else {
      message = MessagesConsts.emailValidacao;
    }
  }
}
