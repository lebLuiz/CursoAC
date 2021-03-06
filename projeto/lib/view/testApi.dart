import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Estado {
  final int id;
  final String sigla;
  final String nome;

  Estado({this.id, this.sigla, this.nome});

  factory Estado.fromJson(Map<String, dynamic> json) {

    return Estado(
      id: json['id'],
      sigla: json['sigla'],
      nome: json['nome'],
    );
  }
}

class TestApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Estado>>(
      future: _fetchEstados(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          List<Estado> data = snapshot.data;
          return _estadosListView(data);
        } else if(snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return CircularProgressIndicator();
      },
    );
  }
  

  Future<List<Estado>> _fetchEstados() async{
    final estadosListApiUrl = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
    final response = await http.get(estadosListApiUrl);

    if(response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((estado) => new Estado.fromJson(estado)).toList();
    } else{
      throw Exception('Falha para encontrar lista na API');
    }
  }

  ListView _estadosListView(data) {

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _tile(data[index].sigla, data[index].nome, Icons.location_searching);
      });
  }

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
    title: Text(
      title,
      style: GoogleFonts.ubuntu(
        fontSize: 20,
        fontWeight: FontWeight.w500
      ),
    ),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Colors.yellow[900],
    ),
  ); 
}
