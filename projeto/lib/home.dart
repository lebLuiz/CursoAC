import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 280.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 300.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/background-home.png'),
                        repeat: ImageRepeat.noRepeat,
                        fit: BoxFit.contain
                      )
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 110.0,
                    width: 165.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo-company.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 168.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Sua empresa\ncompartilhada',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntuMono(
                      color: Colors.purple[900],
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 280.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Ajudamos empresários a divulgar\nsua empresa de forma coletiva',
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    style: GoogleFonts.ubuntu(
                      letterSpacing: 0.5,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 540.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Empresas',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                        color: Colors.purple[900],
                        splashColor: Colors.deepPurple[900],
                        padding: EdgeInsets.only(bottom: 10.0, top: 10.0, left: 80.0, right: 80.0),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Cadastrar',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        color: Colors.black87,
                        splashColor: Colors.black,
                        padding: EdgeInsets.only(bottom: 8.0, top: 8.0, left: 20.0, right: 20.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}