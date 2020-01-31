import 'package:mobx/mobx.dart';
import 'package:pautas_app/consts/messages_consts.dart';
part 'forgot_pass_store.g.dart';

class ForgotPassStore = _ForgotPassStoreBase with _$ForgotPassStore;

abstract class _ForgotPassStoreBase with Store {
  @observable
  String email = '';

  @observable
  bool enviando;

  @observable
  String message;

  @computed
  bool get showButton => email.isNotEmpty;

  @action
  setEmail(String aEmail) {
    email = aEmail;
  }

  bool _validateRegister(String email) {
    message = '';
    if (!email.contains('@')) {
      message = MessagesConsts.emailInvalido;
    }
    return message.isEmpty;
  }
}
