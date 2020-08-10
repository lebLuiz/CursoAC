import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto/company.dart';
import 'package:projeto/view/companyEspecific.dart';

class ListRepository extends StatelessWidget {
  const ListRepository({Key key, this.empresas}) : super(key: key);

  final List<Empresa> empresas;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(15.0),
          shadowColor: Colors.purple[900],
          child: Column(
            children: <Widget>[
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.business_center,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.black,
                  ),
                  title: Text(
                    empresas[index].empresa,
                    style: GoogleFonts.ubuntu(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  subtitle: Text(
                    '${empresas[index].email}\n${empresas[index].telefone}',
                    style: GoogleFonts.roboto(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w600,
                      fontSize: 15.5
                    ),
                  ),
                ),
              ),
              ButtonBar(
                buttonPadding: EdgeInsets.all(8),
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => CompanyEspecific(id: empresas[index].id,),
                      ));
                    },
                    child: Text(
                      'Conhecer',
                      style: GoogleFonts.varela(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.deepPurple[900],
                  ),
                ],
              ),
            ],
          ),
          elevation: 8.0,
        );
      },
      itemCount: empresas.length,
    );
  }
}