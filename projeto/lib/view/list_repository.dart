import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto/company.dart';
import 'package:projeto/view/companyEspecific.dart';

class ListRepository extends StatelessWidget {
  const ListRepository({Key key, this.empresas}) : super(key: key);

  final List<Empresa> empresas;

  @override
  Widget build(BuildContext context) {
    if (empresas.length == 0) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Ops! Se perdeu?!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ubuntu(
                        color: Colors.purple[900],
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Não há empresas cadastradas nessa cidade',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          wordSpacing: 0.3,
                          letterSpacing: 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 300.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/not_found.png'),
                              repeat: ImageRepeat.noRepeat,
                              fit: BoxFit.contain)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        final avatar = empresas[index].avatar_url == null || empresas[index].avatar_url.isEmpty
        ? CircleAvatar(child: Icon(Icons.business_center, color: Colors.white, ), backgroundColor: Colors.black,)
        : CircleAvatar(backgroundImage: NetworkImage(empresas[index].avatar_url ),);

        return Card(
          margin: EdgeInsets.all(15.0),
          shadowColor: Colors.purple[900],
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: avatar,
                  title: Text(
                    empresas[index].empresa,
                    style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    '${empresas[index].ramo}\n${empresas[index].email}',
                    style: GoogleFonts.roboto(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 15.5),
                  ),
                ),
              ),
              ButtonBar(
                buttonPadding: EdgeInsets.all(8),
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompanyEspecific(
                              id: empresas[index].id,
                            ),
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
