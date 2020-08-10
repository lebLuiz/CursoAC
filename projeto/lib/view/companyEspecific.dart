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
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: getEmpresa(),
        builder: (ctx, i) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            heightFactor: 0.5,
                            widthFactor: 10,
                            child: Column(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.black,
                                  child: Icon(
                                    Icons.business_center,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  maxRadius: 40,
                                ),
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
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70,
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
                                              'Telefone:  ',
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.black,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              _empresa[index].telefone,
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.grey[800],
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Email:  ',
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.black,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              _empresa[index].email,
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.grey[800],
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Bairro: ',
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              _empresa[index].endereco,
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.grey[800],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'N°/Complemento: ',
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              _empresa[index].endereco2,
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.grey[800],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 30,
                                          child: Divider(
                                            height: 3,
                                            color: Colors.black,
                                          ),
                                        ),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Responsável: ',
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              _empresa[index].responsavel,
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.grey[800],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
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

                          // Column(
                          //   children: <Widget>[
                          //     Card(
                          //         borderOnForeground: true,
                          //         color: Colors.indigo[50],
                          //         elevation: 0,
                          //         shadowColor: Colors.black,
                          //         margin: EdgeInsets.all(10.0),
                          //         child: Padding(
                          //           padding: const EdgeInsets.all(15.0),
                          //           child: Column(

                          //             children: <Widget>[
                                        
                          //             ],
                          //           ),
                          //         )),
                          //   ],
                          // ),

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: <Widget>[
                          //     Text(
                          //       'CNPJ:  ',
                          //       style: GoogleFonts.ubuntu(
                          //           color: Colors.black,
                          //           fontSize: 22,
                          //           fontWeight: FontWeight.w600),
                          //     ),
                          //     Text(
                          //       _empresa[index].cnpj,
                          //       style: GoogleFonts.ubuntu(
                          //           color: Colors.grey[800],
                          //           fontSize: 20,
                          //           fontWeight: FontWeight.w500),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: <Widget>[
                          //     Text(
                          //       'Responsável:  ',
                          //       style: GoogleFonts.ubuntu(
                          //           color: Colors.black,
                          //           fontSize: 22,
                          //           fontWeight: FontWeight.w600),
                          //     ),
                          //     Text(
                          //       _empresa[index].responsavel,
                          //       style: GoogleFonts.ubuntu(
                          //           color: Colors.grey[800],
                          //           fontSize: 20,
                          //           fontWeight: FontWeight.w500),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 30,
                          // ),
                        ],
                        // margin: EdgeInsets.all(15.0),
                        // shadowColor: Colors.purple[900],
                        // child: Column(
                        //   children: <Widget>[
                        //     Padding(
                        //       padding: const EdgeInsets.all(8.0),
                        //       child: ListTile(
                        //         leading: CircleAvatar(
                        //           child: Icon(
                        //             Icons.business_center,
                        //             color: Colors.white,
                        //           ),
                        //           backgroundColor: Colors.black,
                        //         ),
                        //         title: Text(
                        //           _empresa[index].empresa,
                        //           style: GoogleFonts.ubuntu(
                        //               color: Colors.black,
                        //               fontSize: 22,
                        //               fontWeight: FontWeight.w500),
                        //         ),
                        //         subtitle: Text(
                        //           _empresa[index].email,
                        //           style: GoogleFonts.roboto(
                        //               color: Colors.grey[800],
                        //               fontWeight: FontWeight.w600,
                        //               fontSize: 15.5),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // elevation: 8.0,
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
