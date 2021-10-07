import 'package:avaliar/src/domain/data/models/usuario.dart';
import 'package:avaliar/src/ui/mobile/pages/avaliadores/index.dart';
import 'package:avaliar/src/ui/mobile/pages/home/usuario_info.dart';
import 'package:avaliar/src/ui/mobile/pages/login/index.dart';
import 'package:flutter/material.dart';

import 'menu_item.dart';

class MenuDrawer extends StatelessWidget {
  late UsuarioModel usuarioLogado;

  MenuDrawer({Key? key, required this.usuarioLogado}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UsuarioLogadoInfo(
            usuarioLogado: usuarioLogado,
          ),
          MenuItem(Icons.folder_open, 'Avaliadores', () {
            final rota = MaterialPageRoute(
                builder: (context) => const AvaliadoresPage());

            Navigator.push(context, rota);
          }),
          MenuItem(Icons.folder_open, 'Avaliados', () {
            print('Sobre');
          }),
          const Divider(),
          MenuItem(Icons.info_outline, 'Sobre', () {
            print('Sobre');
          }),
          MenuItem(Icons.exit_to_app_sharp, 'Sair', () {
            final rota =
                MaterialPageRoute(builder: (context) => const LoginPage());

            Navigator.pushReplacement(context, rota);
          }),
        ],
      ),
    );
  }
}
