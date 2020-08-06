import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto/controllerCompany.dart';

class CadCompany extends StatefulWidget {
  @override
  _CadCompanyState createState() => _CadCompanyState();
}

class _CadCompanyState extends State<CadCompany> {


  Future<Company> futureCompany;
  
  @override
  void initState() {
    super.initState();
    //futureCompany = getStates();
  }

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
            letterSpacing: 0.0
          ),
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

      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: myDecoration("Empresa"),
              style: GoogleFonts.ubuntu(
                color: Colors.black,
                fontSize: 22
              ),
              controller: null,//companyController,
              validator: (value) {
                print(value);
                if(value.isEmpty){
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
                color: Colors.black,
                fontSize: 22
              ),
              controller: null,//companyController,
              validator: (value) {
                print(value);
                if(value.isEmpty){
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
                color: Colors.black,
                fontSize: 22
              ),
              controller: null,//companyController,
              validator: (value) {
                print(value);
                if(value.isEmpty){
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
                color: Colors.black,
                fontSize: 22
              ),
              controller: null,//companyController,
              validator: (value) {
                print(value);
                if(value.isEmpty){
                  return "Preencha o campo";
                } else {
                  return null;
                }
              },
            ),

            SizedBox(
              height: 15,
            ),

            //TEM MAIS, NAO ACABOU!
            
          ],
        ),
      ),
    );
  }
}

/*Widget createListView() {
  return new ListView.builder(
    itemCount: ,
  );
}*/

InputDecoration myDecoration(String title){
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