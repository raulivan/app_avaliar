import 'package:avaliar/src/domain/data/models/usuario.dart';
import 'package:avaliar/src/domain/data/repositories/login_repository.dart';
import 'package:flutter/cupertino.dart';

class LoginController extends ChangeNotifier {
  final _repository = LoginRepository();
  final usuario = TextEditingController();
  final senha = TextEditingController();

  void entrarOnPressed(
      {required VoidCallback? Function(UsuarioModel usuario) onSuccess,
      required VoidCallback? Function(String motivo) onFailure}) async {
    try {
      if (usuario.text.trim().isEmpty) throw Exception('Email não informado!');
      if (senha.text.trim().isEmpty) throw Exception('Senha não informada!');

      var usuarioLogado = await _repository.efetuarLogin('admin', '2021');
      //await _repository.efetuarLogin(usuario.text, senha.text);
      onSuccess(usuarioLogado);
    } catch (e) {
      onFailure(e.toString());
    }
  }
}
