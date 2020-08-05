import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

final listC = List<Company>();

Future<Company> getStates() async {
  final res = await http.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados');
  final c = Company(nome: '${res.body}');
  c.nome = '${res.body}/nome';

  //NO PRINT PUXA TODAS AS CIDADES.
  //N SEI COMO FAZER PARA MOSTRAR EM UM WIDGET...
  print({'ESTADOS' : c.nome});
  if(res.statusCode == 200) {
    //ASSIM DA CERTO:
    return Company.fromJson(json.decode('${c.toJson()}'));
    /*for (int i=0; i<=27; i++) {
      final r = '${res.body}/${i}';

      listC.add(Company.fromJson(json.decode(r)));
    }

    print(listC.asMap());*/

    /*for(int i=0; i<=res.body.length; i++) {
      listC.add(Company.fromJson());

      return Company.fromJson(json.decode(res.body)[i]);
    }*/
    
  } else {
    throw Exception('Falha ao carregar!');
  }
}

void totItens(){

}

class Company {
  int id;
  String sigla;
  String nome;

  Company({
    @required this.id,
    @required this.sigla,
    @required this.nome
  });

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sigla = json['sigla'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sigla'] = this.sigla;
    data['nome'] = this.nome;
  }
  
}

/*class Company{
  int id;
  String empresa;
  int cnpj;
  String responsavel;
  int telefone;
  String email;
  String endereco;
  String endereco2;
  String estado;
  String cidade;
  String areaAtuacao;

  Company({
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
    @required this.areaAtuacao,
  });

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    empresa = json['empresa'];
    cnpj = json['cnpj'];
    responsavel = json['responsavel'];
    telefone = json['telefone'];
    email = json['email'];
    endereco = json['endereco'];
    endereco2 = json['endereco2'];
    estado = json['estado'];
    cidade = json['cidade'];
    areaAtuacao = json['areaAtuacao'];
  }

  Map<String, dynamic> toJson(){
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
    data['areaAtuacao'] = this.areaAtuacao;
  }


}*/