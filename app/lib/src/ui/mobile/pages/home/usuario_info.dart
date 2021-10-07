import 'package:avaliar/src/domain/data/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioLogadoInfo extends StatelessWidget {
  late UsuarioModel usuarioLogado;

  UsuarioLogadoInfo({Key? key, required this.usuarioLogado}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.green,
      ),
      child: UserAccountsDrawerHeader(
        accountName: Text(
          usuarioLogado.nome ?? '',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        accountEmail: Text(
          usuarioLogado.email ?? '',
        ),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            getIniciais(usuarioLogado.nome ?? ''),
            style: const TextStyle(fontSize: 40.0, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  String getIniciais(String nome) {
    var nomes = nome.split(' ');
    var iniciais = '';
    for (var item in nomes) {
      iniciais += item.substring(0, 1).toUpperCase();
    }

    return iniciais;
  }
}
