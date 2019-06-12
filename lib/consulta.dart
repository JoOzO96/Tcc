import 'package:flutter/material.dart';

class ConsultaScreen extends StatefulWidget {
  @override
  ConsultaScreenState createState() => new ConsultaScreenState();
}

class ConsultaScreenState extends State<ConsultaScreen> {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: Scaffold(
          floatingActionButton: new FloatingActionButton(onPressed: () => Navigator.pushReplacementNamed(context, "/home"),),
      body: new Center(
        
        child: new Column(
          children: <Widget>[
            new CircularProgressIndicator(),
            new Text("Realizando consulta no PDB...")
          ],
        ),
      ),
    ));
  }
}
