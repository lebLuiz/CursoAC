import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto/company.dart';
import 'package:projeto/controllerCompany.dart';
import 'package:projeto/database.dart';

class CadCompany extends StatefulWidget {
  @override
  _CadCompanyState createState() => _CadCompanyState();
}

class _CadCompanyState extends State<CadCompany> {
  var typeBussines = 'Industrial';
  //Future<Company> futureCompany;

  final _empresaController = TextEditingController();
  final _cnpjController = TextEditingController();
  final _responsavelController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _endereco2Controller = TextEditingController();
  final _estadoController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _ramoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<Empresa> _toDoList = [];
  Empresa _lastRemoved;
  String _carg = '';

  @override
  void initState() {
    super.initState();
    DBProvider.db.initDB();
    //futureCompany = getStates();
  }

  Future<List<Empresa>> getCompanies() async {
    List res = await DBProvider.db.selectAll();

    _toDoList = [];

    res.forEach((element) {
      _toDoList.add(Empresa.fromJson(element));
    });
    print('Os dados: \"${res.asMap()}\" ');
    return _toDoList;
  }

  void _addCompany() {
    setState(() {
      final e = Empresa(
        id: DateTime.now().millisecondsSinceEpoch,
        empresa: _empresaController.text,
        cnpj: _cnpjController.text,
        responsavel: _responsavelController.text,
        telefone: _telefoneController.text,
        email: _emailController.text,
        endereco: _enderecoController.text,
        endereco2: _endereco2Controller.text,
        estado: _estadoController.text,
        cidade: _cidadeController.text,
        //ramo: _carg
        ramo: _ramoController.text,
      );

      DBProvider.db.insert(e.toJson());

      //getCompanies();

      _empresaController.text = '';
      _cnpjController.text = '';
      _responsavelController.text = '';
      _telefoneController.text = '';
      _emailController.text = '';
      _enderecoController.text = '';
      _endereco2Controller.text = '';
      _estadoController.text = '';
      _cidadeController.text = '';
      //_carg = '';
      _ramoController.text = '';
    });
  }

  //LAYOUT EM SI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Cadastrar Empresa",
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
        backgroundColor: Colors.purple[900],
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.all(25.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(3.0),
              children: <Widget>[
                Text(
                  'Dados da Entidade',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    color: Colors.purple[900],
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: Divider(
                    color: Colors.black,
                    height: 15,
                    thickness: 1.5,
                  ),
                ),
                Form(
                  autovalidate: true,
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: myDecoration("Empresa"),
                        style: GoogleFonts.ubuntu(
                            color: Colors.black, fontSize: 22),
                        controller: _empresaController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Preencha o campo";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: myDecoration("CNPJ"),
                        style: GoogleFonts.ubuntu(
                            color: Colors.black, fontSize: 22),
                        controller: _cnpjController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Preencha o campo";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: myDecoration("Responsável"),
                        style: GoogleFonts.ubuntu(
                            color: Colors.black, fontSize: 22),
                        controller: _responsavelController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Preencha o campo";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: myDecoration("Telefone"),
                        style: GoogleFonts.ubuntu(
                            color: Colors.black, fontSize: 22),
                        controller: _telefoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Preencha o campo";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: myDecoration("E-mail"),
                        style: GoogleFonts.ubuntu(
                            color: Colors.black, fontSize: 22),
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Preencha o campo";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: myDecoration("Endereço"),
                        style: GoogleFonts.ubuntu(
                            color: Colors.black, fontSize: 22),
                        controller: _enderecoController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Preencha o campo";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: myDecoration("N°-Complemento"),
                        style: GoogleFonts.ubuntu(
                            color: Colors.black, fontSize: 22),
                        controller: _endereco2Controller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Preencha o campo";
                          } else {
                            return null;
                          }
                        },
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: myDecoration("Estado"),
                        style: GoogleFonts.ubuntu(
                            color: Colors.black, fontSize: 22),
                        controller: _estadoController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Preencha o campo";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: myDecoration("Cidade"),
                        style: GoogleFonts.ubuntu(
                            color: Colors.black, fontSize: 22),
                        controller: _cidadeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Preencha o campo";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      //CASO DER B.O COM O DropDownButton, USO O TextFormField
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Ramo de Atuação',
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.black),
                          alignLabelWithHint: true,
                          hintText: 'ex: Industrial',
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black54,
                          ),
                          errorStyle: TextStyle(
                            height: 0,
                            fontSize: 0,
                            color: Colors.red,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          counterStyle: TextStyle(color: Colors.black),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                        style: GoogleFonts.ubuntu(
                            color: Colors.black, fontSize: 22),
                        controller: _ramoController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Preencha o campo";
                          } else {
                            return null;
                          }
                        },
                      ),

                      // Padding(
                      //   padding: EdgeInsets.all(10.0),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: <Widget>[
                      //       Text(
                      //         'Ramo de Atuação',
                      //         textAlign: TextAlign.center,
                      //         style:
                      //             GoogleFonts.ubuntu(fontSize: 22, color: Colors.black),
                      //       ),
                      //       DropdownButton<String>(
                      //         value: typeBussines,
                      //         icon: Icon(Icons.arrow_downward),
                      //         iconSize: 32,
                      //         elevation: 18,
                      //         style: TextStyle(color: Colors.deepPurple),
                      //         underline: Container(
                      //           height: 4,
                      //           color: Colors.deepPurpleAccent,
                      //         ),
                      //         onChanged: (String newValue) {
                      //           setState(() {
                      //             typeBussines = newValue;
                      //             _carg = typeBussines;
                      //             print(_carg);
                      //           });
                      //         },
                      //         items: <String>[
                      //           'Industrial',
                      //           'Comercial',
                      //           'Prestação de Serviços'
                      //         ].map<DropdownMenuItem<String>>((String value) {
                      //           return DropdownMenuItem<String>(
                      //             value: value,
                      //             child: Text(
                      //               value,
                      //               textAlign: TextAlign.center,
                      //               style: GoogleFonts.ubuntu(
                      //                   fontSize: 24, fontWeight: FontWeight.w500),
                      //             ),
                      //           );
                      //         }).toList(),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      SizedBox(
                        height: 20,
                      ),

                      FlatButton(
                        child: Text(
                          'Cadastrar',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                        color: Colors.purple[900],
                        splashColor: Colors.deepPurple[900],
                        padding: EdgeInsets.only(
                            bottom: 10.0, top: 10.0, left: 80.0, right: 80.0),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _addCompany();
                            Navigator.of(context).pop();
                            //SNACK-BAR PARA AVISAR UM OK-SUCESSO!
                            SnackBar snkBar = SnackBar(
                              content: Text(
                                '${_empresaController.text} cadastrado com sucesso'),
                            );
                            Scaffold.of(context).showSnackBar(snkBar);
                            print('FOI - ${getCompanies()}');
                          }
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
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

//PADRÃO DE DECORAÇÃO DOS INPUT'S
InputDecoration myDecoration(String title) {
  InputDecoration _decorations = InputDecoration(
    labelText: title,
    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
    alignLabelWithHint: true,
    hintText: title,
    hintStyle: TextStyle(
      fontSize: 20.0,
      color: Colors.black54,
    ),
    errorStyle: TextStyle(
      height: 0,
      fontSize: 0,
      color: Colors.red,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
      ),
    ),
    counterStyle: TextStyle(color: Colors.black),
    filled: true,
    fillColor: Colors.grey[100],
  );
  return _decorations;
}
