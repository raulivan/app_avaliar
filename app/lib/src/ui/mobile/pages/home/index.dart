import 'package:avaliar/src/domain/controllers/home_controller.dart';
import 'package:avaliar/src/domain/data/models/usuario.dart';
import 'package:avaliar/src/ui/mobile/pages/home/menu_drawer.dart';
import 'package:avaliar/src/ui/mobile/pages/login/index.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class HomePage extends StatefulWidget {
  final UsuarioModel usuarioLogado;
  const HomePage({Key? key, required this.usuarioLogado}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Bem vindo ao Avaliar, ${widget.usuarioLogado.nome}!'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      drawer: MenuDrawer(
        usuarioLogado: widget.usuarioLogado,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.green[100],
            height: MediaQuery.of(context).size.height / 3,
            child: Center(
              child: Image.asset(
                'assets/images/logo-whatsapp.png',
                height: 200,
                width: 200,
              ),
            ),
          ),
          Expanded(
              child: LoaderOverlay(
            useDefaultLoading: true,
            overlayOpacity: 0.4,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCard(
                        quantidade: 35,
                        texto: 'Total de Avaliações',
                        icone: const Icon(Icons.check),
                        detalhesOnPressed: () {},
                        atualizarOnPressed: () {},
                        future: controller.getTotalAvaliadores(),
                        notifier: controller.totalAvaliadoresNotifier),
                    _buildCard(
                      quantidade: 15,
                      texto: 'Total de Avaliações Pendentes',
                      icone: const Icon(Icons.warning_amber),
                      detalhesOnPressed: () {},
                      atualizarOnPressed: () {},
                      future: controller.getTotalAvaliadores(),
                      notifier: controller.totalAvaliadoresNotifier,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCard(
                      quantidade: 50,
                      texto: 'Total de Avaliados',
                      icone: const Icon(Icons.check),
                      detalhesOnPressed: () {},
                      atualizarOnPressed: () {},
                      future: controller.getTotalAvaliadores(),
                      notifier: controller.totalAvaliadoresNotifier,
                    ),
                    _buildCard(
                      quantidade: 5,
                      texto: 'Total de Avaliadores',
                      icone: const Icon(Icons.warning_amber),
                      detalhesOnPressed: () {},
                      atualizarOnPressed: () async {
                        context.loaderOverlay.show();
                        await controller.getTotalAvaliadores();
                        context.loaderOverlay.hide();
                      },
                      future: controller.getTotalAvaliadores(),
                      notifier: controller.totalAvaliadoresNotifier,
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildCard({
    required int quantidade,
    required String texto,
    required Icon icone,
    required VoidCallback detalhesOnPressed,
    required VoidCallback atualizarOnPressed,
    required Future<int> future,
    required ValueNotifier<int> notifier,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: Colors.black,
        elevation: 5,
        color: Colors.grey[100],
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: FutureBuilder<int>(
                    future: future,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ValueListenableBuilder<int>(
                          valueListenable: notifier,
                          builder: (context, value, child) {
                            return Text(
                              value.toString(),
                              style: const TextStyle(
                                  fontSize: 40, color: Colors.white),
                            );
                          },
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                texto,
                style: const TextStyle(fontSize: 20),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: detalhesOnPressed,
                        child: const Text('Detalhes')),
                    TextButton(
                        onPressed: atualizarOnPressed,
                        child: const Text('Atualizar'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
