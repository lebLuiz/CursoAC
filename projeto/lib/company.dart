import 'package:flutter/cupertino.dart';

class Empresa {

  int id;
  String empresa;
  String avatar_url;
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
    @required this.avatar_url,
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

  factory Empresa.fromJson(Map<String, dynamic> json) {
    return Empresa(
      id: json['id'],
      empresa: json['empresa'],
      avatar_url: json['avatar_url'],
      cnpj: json['cnpj'],
      responsavel: json['responsavel'],
      telefone: json['telefone'],
      email: json['email'],
      endereco: json['endereco'],
      endereco2: json['endereco2'],
      estado: json['estado'],
      cidade: json['cidade'],
      ramo: json['ramo'],
    );
    // id = json['id'];
    // empresa = json['empresa'];
    // empresa = json['cnpj'];
    // empresa = json['responsavel'];
    // empresa = json['telefone'];
    // empresa = json['email'];
    // empresa = json['endereco'];
    // empresa = json['endereco2'];
    // empresa = json['estado'];
    // empresa = json['cidade'];
    // empresa = json['ramo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['empresa'] = this.empresa;
    data['avatar_url'] = this.avatar_url;
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