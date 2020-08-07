import 'package:flutter/cupertino.dart';

class Empresa {

  int id;
  String empresa;
  String cnpj;
  String responsavel;
  String telefone;
  String email;
  String endereco;
  String endereco2;
  String estado;
  String cidade;
  String ramo;

  Empresa({
    @required this.id,
    @required this.empresa,
    @required this.cnpj,
    @required this.responsavel,
    @required this.telefone,
    @required this.email,
    @required this.endereco,
    @required this.endereco2,
    @required this.estado,
    @required this.cidade,
    @required this.ramo,
  });

  Empresa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    empresa = json['empresa'];
    empresa = json['cnpj'];
    empresa = json['responsavel'];
    empresa = json['telefone'];
    empresa = json['email'];
    empresa = json['endereco'];
    empresa = json['endereco2'];
    empresa = json['estado'];
    empresa = json['cidade'];
    empresa = json['ramo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['empresa'] = this.empresa;
    data['cnpj'] = this.cnpj;
    data['responsavel'] = this.responsavel;
    data['telefone'] = this.telefone;
    data['email'] = this.email;
    data['endereco'] = this.endereco;
    data['endereco2'] = this.endereco2;
    data['estado'] = this.estado;
    data['cidade'] = this.cidade;
    data['ramo'] = this.ramo;
    return data;
  }
}