import 'dart:convert';

class AvaliadorModel {
  int? id;
  String? nome;
  AvaliadorModel({
    this.id,
    this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  factory AvaliadorModel.fromMap(Map<String, dynamic> map) {
    return AvaliadorModel(
      id: map['id'],
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AvaliadorModel.fromJson(String source) =>
      AvaliadorModel.fromMap(json.decode(source));
}
