import 'package:avaliar/src/domain/data/models/avaliador.dart';
import 'package:avaliar/src/domain/data/repositories/avaliador_repository.dart';
import 'package:flutter/foundation.dart';

class AvaliadorController extends ChangeNotifier {
  final repository = AvaliadorRepository();

  ValueNotifier<List<AvaliadorModel>> dataSourceNotifier =
      ValueNotifier(<AvaliadorModel>[]);
  set dataSource(value) => dataSourceNotifier.value = value;
  List<AvaliadorModel> get dataSource => dataSourceNotifier.value;

  Future<void> atualizarDados() async {
    try {
      repository.getAvaliadores().then((value) {
        dataSource = value;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<bool> excluirOnPressed(AvaliadorModel registro) async {
    return await repository.excluir(registro);
  }
}
