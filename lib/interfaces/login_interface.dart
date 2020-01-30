import 'package:pautas_app/models/usuario_model.dart';

abstract class LoginInterface {
  void validateEmail(String email);
  void validateSennha(String senha);
  void lembrarMe(bool check);
  void esqueceuSenha();
  bool logar(Usuario usuario);
}