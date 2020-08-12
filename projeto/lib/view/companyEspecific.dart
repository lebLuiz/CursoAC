import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto/company.dart';
import 'package:projeto/database.dart';

class CompanyEspecific extends StatefulWidget {
  final int id;

  const CompanyEspecific({Key key, this.id}) : super(key: key);

  @override
  _CompanyEspecificState createState() => _CompanyEspecificState();
}

class _CompanyEspecificState extends State<CompanyEspecific> {
  final _empresa = List<Empresa>();

  Future<void> getEmpresa() async {
    List response = await DBProvider.db.selectById(widget.id);

    response.forEach((element) {
      _empresa.add(Empresa.fromJson(element));
    });

    print('Quantidade Empresas: ${_empresa.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: getEmpresa(),
        builder: (ctx, i) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20, bottom: 10, right: 10, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final avatar = _empresa[index].avatar_url == null ||
                              _empresa[index].avatar_url.isEmpty
                          ? CircleAvatar(
                              child: Icon(
                                Icons.business_center,
                                color: Colors.white,
                                size: 50,
                              ),
                              backgroundColor: Colors.black,
                              maxRadius: 40,
                            )
                          : CircleAvatar(
                              backgroundImage:
                                  NetworkImage(_empresa[index].avatar_url),
                              maxRadius: 40,
                            );

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            heightFactor: 1,
                            widthFactor: 10,
                            child: Column(
                              children: <Widget>[
                                avatar,
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  _empresa[index].empresa,
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.purple[900],
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '${_empresa[index].cidade} - ${_empresa[index].estado}',
                                      style: GoogleFonts.roboto(
                                          fontSize: 17,
                                          color: Colors.blueGrey[900],
                                          wordSpacing: 2,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Column(
                            children: <Widget>[
                              Card(
                                  borderOnForeground: true,
                                  color: Colors.indigo[50],
                                  elevation: 0,
                                  shadowColor: Colors.black,
                                  margin: EdgeInsets.all(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Contato',
                                          textAlign: TextAlign.justify,
                                          textDirection: TextDirection.ltr,
                                          style: GoogleFonts.roboto(
                                              color: Colors.purple[900],
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Telefone',
                                              style: GoogleFonts.ubuntu(
                                                color: Colors.black,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: Text(
                                               _empresa[index].telefone,
                                                style: GoogleFonts.ubuntu(
                                                  color: Colors.grey[800],
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Email',
                                              style: GoogleFonts.ubuntu(
                                                color: Colors.black,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: Text(
                                                _empresa[index].email,
                                                style: GoogleFonts.ubuntu(
                                                  color: Colors.grey[800],
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          'Endereço',
                                          textAlign: TextAlign.justify,
                                          textDirection: TextDirection.ltr,
                                          style: GoogleFonts.roboto(
                                              color: Colors.purple[900],
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Bairro',
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.black,
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: Text(
                                                _empresa[index].endereco,
                                                style: GoogleFonts.ubuntu(
                                                  color: Colors.grey[800],
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w500
                                                ),
                                                maxLines: 3,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'N°/Complemento',
                                              style: GoogleFonts.ubuntu(
                                                color: Colors.black,
                                                fontSize: 21,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: Text(
                                                _empresa[index].endereco2,
                                                style: GoogleFonts.ubuntu(
                                                    color: Colors.grey[800],
                                                    fontSize: 19,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                maxLines: 5,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                          child: Divider(
                                            height: 3,
                                            color: Colors.black,
                                            thickness: 1.0,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Responsável: ',
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: Text(
                                                _empresa[index].responsavel,
                                                style: GoogleFonts.ubuntu(
                                                    color: Colors.grey[800],
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500
                                                ),
                                                maxLines: 3,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'CNPJ: ',
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              _empresa[index].cnpj,
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.grey[800],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      );
                    },
                    itemCount: _empresa.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
