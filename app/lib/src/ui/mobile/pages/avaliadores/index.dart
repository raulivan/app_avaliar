import 'package:avaliar/src/domain/controllers/avaliador_controller.dart';
import 'package:avaliar/src/domain/data/models/avaliador.dart';
import 'package:flutter/material.dart';

import 'edicao.dart';

class AvaliadoresPage extends StatefulWidget {
  const AvaliadoresPage({Key? key}) : super(key: key);

  @override
  _AvaliadoresPageState createState() => _AvaliadoresPageState();
}

class _AvaliadoresPageState extends State<AvaliadoresPage> {
  final controller = AvaliadorController();

  @override
  void initState() {
    super.initState();

    controller.atualizarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Manutenção de avaliadores'),
          backgroundColor: Colors.green,
          actions: [
            ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AvaliadorEdicaoPage(
                              current: null,
                            )));
                controller.atualizarDados();
              },
              child: const Text('Criar novo avaliador'),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(10.0),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.orange),
              ),
            )
          ],
        ),
        body: ValueListenableBuilder<List<AvaliadorModel>>(
          valueListenable: controller.dataSourceNotifier,
          builder: (context, value, child) {
            return RefreshIndicator(
              onRefresh: () async => controller.atualizarDados(),
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: controller.dataSource.length,
                  itemBuilder: (context, index) {
                    final current = controller.dataSource[index];
                    return Padding(
                      key:
                          Key(DateTime.now().millisecondsSinceEpoch.toString()),
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                      child: ListTile(
                          leading: const Icon(Icons.contact_page),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      final registro = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AvaliadorEdicaoPage(
                                                    current: current,
                                                  )));
                                      if (registro == true) {
                                        controller.atualizarDados();
                                      }
                                    },
                                    icon: const Icon(Icons.edit_outlined)),
                                IconButton(
                                    onPressed: () async {
                                      var sucesso = await controller
                                          .excluirOnPressed(current);
                                      if (sucesso == true) {
                                        controller.atualizarDados();
                                      }
                                    },
                                    icon: const Icon(Icons.delete_outline))
                              ],
                            ),
                          ),
                          title: Text(current.nome ?? '')),
                    );
                  }),
            );
          },
        ));
  }
}
