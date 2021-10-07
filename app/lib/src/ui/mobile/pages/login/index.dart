// ignore_for_file: sized_box_for_whitespace

import 'package:avaliar/src/domain/controllers/login_controller.dart';
import 'package:avaliar/src/domain/data/models/usuario.dart';
import 'package:avaliar/src/ui/mobile/pages/home/index.dart';
import 'package:avaliar/src/ui/shared/caixa_dialogo/index.dart';
import 'package:avaliar/src/ui/shared/components/botoes/padrao_button.dart';
import 'package:avaliar/src/ui/shared/components/caixas_texto/input_text.dart';
import 'package:avaliar/src/ui/shared/components/rotulos/input_label.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: Image.asset(
                'assets/images/logo-whatsapp.png',
                height: 200,
                width: 200,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                    child: InputLabel(texto: 'Usuário de acesso'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                    child: InputText(
                      controller: controller.usuario,
                      hintText: 'usuario2020',
                      keyboardType: TextInputType.text,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Usuário não informado'
                          : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                    child: InputLabel(texto: 'Senha de acesso'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                    child: InputText(
                      controller: controller.senha,
                      hintText: 'abc123',
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Senha não informada'
                          : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                    child: PadraoButton(
                      text: 'Entrar',
                      onPressed: () {
                        if (!_formkey.currentState!.validate()) return;
                        controller.entrarOnPressed(onSuccess: (usuarioLogado) {
                          final rota = MaterialPageRoute(
                              builder: (context) =>
                                  HomePage(usuarioLogado: usuarioLogado));

                          Navigator.pushReplacement(context, rota);
                        }, onFailure: (erro) {
                          MsgBox()
                              .atencao(context, titulo: 'ATENÇÃO', texto: erro);
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
