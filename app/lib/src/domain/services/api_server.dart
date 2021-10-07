import 'package:http/http.dart' as http;

class Api {
  static const base_uri = 'http://192.168.1.67:3000';

  /*
  Future<bool> testConexao() async {
    http.Response response;
    response = await http.get(base_uri);
    print(response.body);
    return response.statusCode == 200;
  }*/

  Future<http.Response> login(String user, String pass) async {
    final url = Uri.parse('${Api.base_uri}/auth');
    http.Response response;
    response = await http.post(url, body: {'login': user, 'senha': pass});
    return response;
  }
}
