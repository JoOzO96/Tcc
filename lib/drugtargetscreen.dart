import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unidb/Classes/chembl/chembl.dart';
import 'package:unidb/Classes/chembl/chemblmolecule.dart';
import 'package:unidb/Classes/drugtarget/bioactivities.dart';
import 'package:unidb/Classes/drugtarget/drugtargetcommons.dart';
import 'package:unidb/Classes/pubmed/pubmed.dart';
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
  List<Quimicos> listaMoleculasTemp = new List();

  bool adicionar = false;
  @override
  void initState() {
    super.initState();
    testeconsulta();
  }

  testeconsulta() async {
    try {
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
              (i + 1).toString() +
              " of " +
              bioactivities.length.toString() +
              " interactions.";
        });
        listaCheml.add(chembl);
        listaCheml = listaCheml.where((p) => p.resourceUrl.isNotEmpty).toList();
      }

      for (int i = 0; listaCheml.length > i; i++) {
        response = await http.get("https://www.ebi.ac.uk" +
            listaCheml.elementAt(i).resourceUrl +
            "?format=json");
        resposta = response.body;
        Map mapDados = json.decode(resposta);
        chemblMolecule = Quimicos.fromJson(mapDados);
        setState(() {
          mensagem = "CHEMBL: " +
              (i + 1).toString() +
              " of " +
              listaCheml.length.toString() +
              " drugs.";
        });
        listaMoleculas.add(chemblMolecule);
      }
      listaMoleculas =
          listaMoleculas.where((p) => p.prefName != "No name").toList();
      listaMoleculasTemp = listaMoleculas.toList();
      listaMoleculas.clear();
      for (int i = 0; listaMoleculasTemp.length > i; i++) {
        adicionar = true;
        for (int j = 0; listaMoleculas.length > j; j++) {
          if (listaMoleculas.elementAt(j).moleculeChemblId ==
              listaMoleculasTemp.elementAt(i).moleculeChemblId) {
            adicionar = false;
          }
        }
        if (adicionar) {
          listaMoleculas.add(listaMoleculasTemp.elementAt(i));
        }
      }

      setState(() {
        consultaconcluida = true;
      });
    } on Error catch (e) {}
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
            child: new Text("No molecule information."),
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
                  new Text("Querying the Databases..."),
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
