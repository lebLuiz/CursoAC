import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Estado {
  final int id;
  final String sigla;
  final String nome;
  /*final Regiao regiao;
  final List<String> c;*/

  Estado({this.id, this.sigla, this.nome /*this.regiao, this.c*/});

  factory Estado.fromJson(Map<String, dynamic> json) {
    /*id = json['id'];
    sigla = json['sigla'];
    nome = json['nome'];
    regiao =
        json['regiao'] != null ? new Regiao.fromJson(json['regiao']) : null;
*/
    /*var cFromJson = json['nome'];
    List<String> cList = cFromJson.cast<String>();*/

    return Estado(
      id: json['id'],
      sigla: json['sigla'],
      nome: json['nome'],
      // regiao: json['regiao'],
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
        return _tile(data[index].sigla, data[index].nome, Icons.work);
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
      color: Colors.blue[900],
    ),
  ); 
}






// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:projeto/controllerCompany.dart';

// class TestApi extends StatefulWidget {
//   @override
//   _TestApiState createState() => _TestApiState();
// }

// class _TestApiState extends State<TestApi> {


//   Future<Company> futureCompany;
  
//   @override
//   void initState() {
//     super.initState();
//     futureCompany = getStates() as Future<Company>;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Estados',
//       theme: ThemeData(
//         primarySwatch: Colors.yellow
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('ESTADOS'),
//         ),
//         body: Center(
//           child: go(context),
//         ),
//       ),
//     );
//   }
// }

// ListView _listView(data) {
//   return ListView.builder(
//     itemCount: data.length,
//     itemBuilder: (context, index) {
//       return _tile(data[index].position, data[index].company, Icons.work);
//     });
// }

// ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
//   title: Text(
//     title,
//     style: GoogleFonts.ubuntu(
//       fontSize: 20,
//       fontWeight: FontWeight.w500
//     )),
//     subtitle: Text(subtitle),
//     leading: Icon(
//       icon,
//       color: Colors.indigo[900],
//     ),
// );

// Widget go(BuildContext context) {
//   return FutureBuilder<List<Company>>(
//     future: getStates(),
//     builder: (context, snapshot) {
//       if(snapshot.hasData) {
//         List<Company> data = snapshot.data;
//         return _listView(data);
//       } else if(snapshot.hasError) {
//         return Text('${snapshot.error}');
//       }
//       return CircularProgressIndicator();
//     },
//   );
// }