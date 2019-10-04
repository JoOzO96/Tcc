import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unidb/Classes/drugtarget/bioactivities.dart';
import 'package:unidb/Classes/drugtarget/drugtargetcommons.dart';

class DrugTargetScreen extends StatefulWidget {
  final String uniprot;
  DrugTargetScreen(this.uniprot);
  @override
  DrugTargetScreenState createState() => new DrugTargetScreenState();
}

class DrugTargetScreenState extends State<DrugTargetScreen> {
  DrugTarget drugTarget;
  bool consultaconcluida = false;
  @override
  void initState() {
    super.initState();
    testeconsulta();
  }

  testeconsulta() async {
    var response;
    response = await http.get(
        "https://drugtargetcommons.fimm.fi/api/data/bioactivity/?uniprot_id=" +
            widget.uniprot +
            "&format=json");
    Map userMap = json.decode(response.body);
    drugTarget = DrugTarget.fromJson(userMap);
    List<Bioactivities> bioactivities = drugTarget.bioactivities;
    bioactivities = bioactivities.where((p) => p.chemblId != null).toList();
    print("oi");
    setState(() {
      consultaconcluida = true;  
    });
    
  }

  @override
  Widget build(BuildContext context) {
    if (consultaconcluida) {
      return new Scaffold(
          floatingActionButton:
              new FloatingActionButton(onPressed: () => Navigator.pop(context)),
          body: new Center(
              child: new Column(
            children: <Widget>[
              
            ],
          )));
    } else {
      return new Scaffold(
          floatingActionButton:
              new FloatingActionButton(onPressed: () => Navigator.pop(context)),
          body: new Center(
              child: new Column(
            children: <Widget>[
              new CircularProgressIndicator(),
              new Text("Realizando consulta nos bancos de dados..."),
            ],
          )));
    }
  }
}
