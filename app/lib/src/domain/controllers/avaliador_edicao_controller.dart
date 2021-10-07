import 'package:avaliar/src/domain/data/models/avaliador.dart';
import 'package:avaliar/src/domain/data/repositories/avaliador_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AvaliadorEdicaoController extends ChangeNotifier {
  final _repository = AvaliadorRepository();

  ValueNotifier<AvaliadorModel?> currentNotifier = ValueNotifier(null);
  set current(value) => currentNotifier.value = value;
  AvaliadorModel? get current => currentNotifier.value;

  final nome = TextEditingController();

  void inicializaCurrent(AvaliadorModel? registro) {
    if (registro != null) {
      current = registro;
      nome.text = registro.nome!;
    }
  }

  void salvarOnPressed(
      {required VoidCallback? Function() onSuccess,
      required VoidCallback? Function(String motivo) onFailure}) async {
    try {
      if (nome.text.trim().isEmpty) throw Exception('Nome não informado!');

      if (current == null) {
        await _repository.incluir(AvaliadorModel(nome: nome.text, id: 0));
        onSuccess();
      } else {
        await _repository
            .alterar(AvaliadorModel(nome: nome.text, id: current!.id));
        onSuccess();
      }
    } catch (e) {
      onFailure(e.toString());
    }
  }
}
