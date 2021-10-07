import 'dart:convert';

import 'package:avaliar/src/domain/data/models/usuario.dart';
import 'package:avaliar/src/domain/services/api_server.dart';

class LoginRepository {
  Future<UsuarioModel> efetuarLogin(String usuario, String senha) async {
    final api = Api();

    final retorno = await api.login(usuario, senha);

    if (retorno.statusCode == 200) {
      return UsuarioModel.fromJson(retorno.body);
    } else {
      throw Exception(json.decode(retorno.body)['message']);
    }
  }
}
