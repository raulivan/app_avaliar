import 'package:flutter/material.dart';

class MsgBox {
  void informacao(BuildContext context,
      {@required String? titulo, @required String? texto}) {
    var btnOK = TextButton(
        child: const Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        });

    var alerta = AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.warning),
          const SizedBox(width: 5),
          Text(texto!)
        ],
      ),
      content: Text(titulo!),
      actions: [
        btnOK,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  void atencao(BuildContext context,
      {@required String? titulo, @required String? texto}) {
    var btnOK = TextButton(
        child: const Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        });

    var alerta = AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.warning),
          const SizedBox(width: 5),
          Text(titulo!)
        ],
      ),
      content: Text(texto!),
      actions: [
        btnOK,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  void confirmacao(
    BuildContext context, {
    @required String? titulo,
    @required String? texto,
    @required VoidCallback? simOnClick,
    @required VoidCallback? naoOnClick,
  }) {
    var btnSim = TextButton(
        child: const Text("Sim"),
        onPressed: () {
          Navigator.of(context).pop();
          simOnClick!();
        });

    var btnNao = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          naoOnClick!();
        },
        child: const Text('Não'));

    var alerta = AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.question_answer),
          const SizedBox(width: 5),
          Text(titulo!)
        ],
      ),
      content: Text(texto!),
      actions: [btnSim, btnNao],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
