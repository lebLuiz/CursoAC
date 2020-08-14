import 'package:flutter/cupertino.dart';

class Tarefa {
  int id;
  String titulo;
  int ok;

  //ok:  0 - true;   1 - false;

  Tarefa({
    @required this.id,
    @required this.titulo,
    @required this.ok
  });

  Tarefa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    ok = json['ok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['ok'] = this.ok;
    return data;
  }
}