import 'package:avaliar/src/domain/controllers/avaliador_edicao_controller.dart';
import 'package:avaliar/src/domain/data/models/avaliador.dart';
import 'package:avaliar/src/ui/shared/caixa_dialogo/index.dart';
import 'package:avaliar/src/ui/shared/components/botoes/padrao_button.dart';
import 'package:avaliar/src/ui/shared/components/caixas_texto/input_text.dart';
import 'package:avaliar/src/ui/shared/components/rotulos/input_label.dart';
import 'package:flutter/material.dart';

class AvaliadorEdicaoPage extends StatefulWidget {
  AvaliadorModel? current;
  AvaliadorEdicaoPage({Key? key, this.current}) : super(key: key);

  @override
  _AvaliadorEdicaoPageState createState() => _AvaliadorEdicaoPageState();
}

class _AvaliadorEdicaoPageState extends State<AvaliadorEdicaoPage> {
  final _formkey = GlobalKey<FormState>();
  final controller = AvaliadorEdicaoController();

  @override
  void initState() {
    super.initState();
    controller.inicializaCurrent(widget.current);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edição/Inclusão'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.green[100],
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                  child: InputLabel(texto: 'Nome:'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                  child: InputText(
                    controller: controller.nome,
                    hintText: 'Fulano de tal',
                    keyboardType: TextInputType.text,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Nome não informado'
                        : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                  child: PadraoButton(
                    text: 'Salvar',
                    onPressed: () {
                      if (!_formkey.currentState!.validate()) return;
                      print('Clicou em Salvar!');
                      controller.salvarOnPressed(onSuccess: () {
                        Navigator.pop(context, true);
                      }, onFailure: (erro) {
                        print(erro);
                        controller.nome.text = erro;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                  child: PadraoButton(
                    text: 'Cancelar',
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
