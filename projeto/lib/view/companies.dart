import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto/company.dart';
import 'package:projeto/database.dart';

class ListCompanies extends StatefulWidget {
  final String city;

  const ListCompanies({Key key, this.city});

  @override
  _ListCompaniesState createState() => _ListCompaniesState();
}

class _ListCompaniesState extends State<ListCompanies> {

  List<Empresa> _toDoList = [];

  Future<List<Empresa>> getEmpresas() async {
    //List res = await DBProvider.db.selectAll();
    List res = await DBProvider.db.selectByCity(widget.city);
    //_toDoList = [];

    res.forEach((element) {
      _toDoList.add(Empresa.fromJson(element));
      print("Os dados: $element");
    });
    print('Quantidade de items: \"${_toDoList.length}\" ');
    return _toDoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Empresas",
          style: GoogleFonts.ubuntu(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              wordSpacing: 2.0,
              letterSpacing: 0.0),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: Colors.deepPurple[900],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Builder(
            builder: (_)  {
              getEmpresas();
              return Text('${widget.city}');
            },
          ),
        ],
      )
    );
  }
}