import 'dart:convert';
import 'package:avaliar/src/domain/data/models/avaliador.dart';
import 'package:http/http.dart' as http;
import 'package:avaliar/src/domain/services/api_server.dart';

class AvaliadorRepository {
  Future<int> getCount() async {
    final url = Uri.parse('${Api.base_uri}/avaliador/status');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }

  Future<List<AvaliadorModel>> getAvaliadores() async {
    final url = Uri.parse('${Api.base_uri}/avaliador/');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var retorno = <AvaliadorModel>[];

      var lista = json.decode(response.body)['data'];
      for (var item in lista) {
        retorno.add(AvaliadorModel.fromMap(item));
      }
      return retorno;
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }

  Future<bool> incluir(AvaliadorModel avaliador) async {
    final url = Uri.parse('${Api.base_uri}/avaliador/');

    //var corpo = json.encode({'id': avaliador.id, 'nome': avaliador.nome});

    Map<String, dynamic> corpo = {
      'id': avaliador.id.toString(),
      'nome': avaliador.nome
    };

    http.Response response = await http.post(url, body: corpo);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }

  Future<bool> alterar(AvaliadorModel avaliador) async {
    try {
      final url = Uri.parse('${Api.base_uri}/avaliador/${avaliador.id}');

      Map<String, dynamic> corpo = {
        'id': avaliador.id.toString(),
        'nome': avaliador.nome
      };
      http.Response response = await http.put(url, body: corpo);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception(json.decode(response.body)['message']);
      }
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> excluir(AvaliadorModel avaliador) async {
    final url = Uri.parse('${Api.base_uri}/avaliador/${avaliador.id}');

    http.Response response = await http.delete(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }
}
