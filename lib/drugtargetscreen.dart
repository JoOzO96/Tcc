import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unidb/Classes/chembl/chembl.dart';
import 'package:unidb/Classes/chembl/chemblmolecule.dart';
import 'package:unidb/Classes/drugtarget/bioactivities.dart';
import 'package:unidb/Classes/drugtarget/drugtargetcommons.dart';
import 'package:unidb/chembl.dart';
import 'package:xml2json/xml2json.dart';

class DrugTargetScreen extends StatefulWidget {
  final String uniprot;
  DrugTargetScreen(this.uniprot);
  @override
  DrugTargetScreenState createState() => new DrugTargetScreenState();
}

class DrugTargetScreenState extends State<DrugTargetScreen> {
  DrugTarget drugTarget;
  List<Bioactivities> bioactivities = new List();
  bool consultaconcluida = false;
  List<ChemblIdLookup> listaCheml = new List();
  ChemblIdLookup chembl = new ChemblIdLookup();
  String resposta = "";
  String mensagem = "";
  Xml2Json xml2json = new Xml2Json();
  Quimicos chemblMolecule = new Quimicos();
  List<Quimicos> listaMoleculas = new List();
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
    bioactivities = drugTarget.bioactivities;
    bioactivities = bioactivities.where((p) => p.chemblId != null).toList();

    for (int i = 0; bioactivities.length > i; i++) {
      response = await http.get(
          "https://www.ebi.ac.uk/chembl/api/data/chembl_id_lookup/" +
              bioactivities.elementAt(i).chemblId +
              "?format=json");
      resposta = response.body;
      Map mapChembl = json.decode(resposta);
      chembl = ChemblIdLookup.fromJson(mapChembl);
      setState(() {
        mensagem = "CHEMBL: " +
            i.toString() +
            " de " +
            bioactivities.length.toString() +
            " interações.";
      });
      listaCheml.add(chembl);
      listaCheml = listaCheml.where((p) => p.resourceUrl.isNotEmpty).toList();
    }

    for (int i = 0; listaCheml.length > i; i++) {
      response = await http.get("https://www.ebi.ac.uk" +
          listaCheml.elementAt(i).resourceUrl +
          "?format=json");
      print("https://www.ebi.ac.uk" +
          listaCheml.elementAt(i).resourceUrl +
          "?format=json");
      resposta = response.body;
      Map mapDados = json.decode(resposta);
      chemblMolecule = Quimicos.fromJson(mapDados);
      setState(() {
        mensagem = "CHEMBL: " +
            i.toString() +
            " de " +
            listaCheml.length.toString() +
            " drogas consultadas.";
      });
      listaMoleculas.add(chemblMolecule);
    }

    setState(() {
      consultaconcluida = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (consultaconcluida && listaMoleculas.length == 0) {
      return new Scaffold(
        floatingActionButton: new FloatingActionButton(
            child: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context)),
        body: Container(
            child: new Container(
          margin: new EdgeInsets.all(30),
          child: new Center(
            child: new Text("Sem informacoes de moleculas"),
          ),
        )),
      );
    } else if (consultaconcluida && listaMoleculas.length > 0) {
      return new Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: new FloatingActionButton(
              child: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context)),
          body: new SafeArea(
            child: Container(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2, crossAxisCount: 1),
                    delegate: new SliverChildBuilderDelegate(
                      (context, index) => new ChemblCard(listaMoleculas[index]),
                      childCount: listaMoleculas.length,
                    ),
                  ),
                ],
              ),
            ),
          ));
    } else {
      return new Scaffold(
          floatingActionButton: new FloatingActionButton(
              child: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context)),
          body: new SafeArea(
            child: Container(
                child: Center(
              child: Column(
                children: <Widget>[
                  new CircularProgressIndicator(),
                  new Text("Realizando consulta nos bancos de dados..."),
                  new Text(mensagem),
                ],
              ),
            )),
          ));
    }
  }
}
// new Container(
//               child: new Column(
//             children: <Widget>[
//               new CircularProgressIndicator(),
//               new Text("Realizando consulta nos bancos de dados..."),
//             ],
//           ))
// SliverGrid(
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2),
//   delegate: new SliverChildBuilderDelegate(
//     (context, index) => new ChemblCard(bioactivities[index]),
//     childCount: bioactivities.length,
//   ),
// ),
