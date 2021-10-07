import 'package:avaliar/src/domain/data/models/usuario.dart';
import 'package:avaliar/src/domain/data/repositories/avaliador_repository.dart';
import 'package:flutter/material.dart';

//enum HomeControllerState { pronto, carregando, atualizandoAvaliadores }

class HomeController extends ChangeNotifier {
  /*ValueNotifier<HomeControllerState> stateNotifier =
      ValueNotifier(HomeControllerState.pronto);
  set state(value) => stateNotifier.value = value;
  HomeControllerState? get state => stateNotifier.value;*/

  ValueNotifier<UsuarioModel?> usuarioLogadoNotifier = ValueNotifier(null);
  set usuarioLogado(value) => usuarioLogadoNotifier.value = value;
  UsuarioModel? get usuarioLogado => usuarioLogadoNotifier.value;

  ValueNotifier<int> totalAvaliadoresNotifier = ValueNotifier(0);
  set totalAvaliadores(value) => totalAvaliadoresNotifier.value = value;
  int get totalAvaliadores => totalAvaliadoresNotifier.value;

  Future<int> getTotalAvaliadores() async {
    print('Executando...');
    final rep = AvaliadorRepository();
    totalAvaliadores = await rep.getCount();
    return totalAvaliadores;
  }

  Future<void> atualzarAvaliadoresOnPressed() async {
    //state = HomeControllerState.atualizandoAvaliadores;
    await getTotalAvaliadores();
    //state = HomeControllerState.pronto;
  }
}
