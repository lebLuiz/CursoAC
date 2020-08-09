import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto/company.dart';
import 'package:projeto/database.dart';
import 'package:projeto/main.dart';

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

  Widget _listCompanies(BuildContext context) {
    getEmpresas();
    if (_toDoList.length == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Nem uma empresa encontrada nessa cidade.',
            textAlign: TextAlign.center,
            style:
                GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      );
    } else {
      for (final item in _toDoList) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            child: Icon(Icons.business_center),
          ),
          title: Text(item.empresa),
          subtitle: Text('${item.ramo}  -  ${item.telefone}'),
          trailing: Container(
            width: 100,
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.input),
                  color: Colors.purple[900],
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.COMPANY_ESPECIFIC,
                      arguments: item,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }
    }
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
      body: ListView.builder(
        itemBuilder: (ctx, i) => _listCompanies(context),
      ),
    );
  }
}
