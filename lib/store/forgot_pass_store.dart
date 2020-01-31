import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mobx/mobx.dart';
import 'package:pautas_app/consts/messages_consts.dart';
import 'package:pautas_app/models/usuario_model.dart';
import 'package:pautas_app/repository/repository_usuarios.dart';
part 'forgot_pass_store.g.dart';

class ForgotPassStore = _ForgotPassStoreBase with _$ForgotPassStore;

abstract class _ForgotPassStoreBase with Store {
  @observable
  String email = '';

  @observable
  bool enviado;

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

  @action
  sendEmail() async {
    if (_validateRegister(email)) {
      Usuario usuario = Usuario(email: email);
      Usuario usuRetorno = await RepositoryUsuarios.getUsuario(usuario);
      if (usuRetorno != null) {
        final Email email = Email(
          body:
              'Caro(a) ${usuRetorno.nome} você solicitou a recuperação de sua senha ' +
                  'para o uso do app UDSPautas. /n' +
                  'Sua senha é: ${usuRetorno.senha}',
          subject: 'UDSPautas - Recuperação de Senha',
          recipients: [usuRetorno.email],
          isHTML: false,
        );
        enviado = false;
        enviando = true;
        await FlutterEmailSender.send(email);
        enviado = true;
        enviando = false;
      } else {
        message = MessagesConsts.emailIncorreto;
      }
    }
  }

  bool _validateRegister(String email) {
    message = '';
    if (!email.contains('@')) {
      message = MessagesConsts.emailInvalido;
    }
    return message.isEmpty;
  }
}
