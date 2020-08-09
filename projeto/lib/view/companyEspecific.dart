import 'package:flutter/material.dart';

class CompanyEspecific extends StatefulWidget {
  @override
  _CompanyEspecificState createState() => _CompanyEspecificState();
}

class _CompanyEspecificState extends State<CompanyEspecific> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VEM PARA EMPRESA!'),
        backgroundColor: Colors.purple[900],
      ),
    );
  }
}