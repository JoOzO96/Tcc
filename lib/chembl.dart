import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:unidb/Classes/chembl/chemblmolecule.dart';
import 'package:unidb/Classes/pubmed/pubmed.dart';

class ChemblCard extends StatefulWidget {
  final Quimicos _chemblMolecule;
  ChemblCard(this._chemblMolecule);

  @override
  _ChemblCardState createState() => _ChemblCardState();
}

class _ChemblCardState extends State<ChemblCard> {
  bool segue = false;
  String listaNomes = "";
  String formula = "No information";
  List<String> lista = new List();
  Etuilspubmed eutilspubmed = new Etuilspubmed();
  String trabalhosPubmed = "0";

  @override
  void initState() {
    super.initState();
    testeconsulta();
  }

  testeconsulta() async {
    try {
      var response = await http.get(
          "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=" +
              widget._chemblMolecule.prefName +
              "&retmax=100&usehistory=y&format=json");
      print(
          "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=" +
              widget._chemblMolecule.prefName +
              "&retmax=100&usehistory=y&format=json");
      Map userMap = json.decode(response.body);
      eutilspubmed = Etuilspubmed.fromJson(userMap);
      trabalhosPubmed = eutilspubmed.esearchresult.retmax;
      if ( eutilspubmed.esearchresult.retmax == "100"){
        trabalhosPubmed = "> 100";
      }
      setState(() {});
    } on Error catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    if (widget._chemblMolecule.moleculeSynonyms != null) {
      for (int i = 0; widget._chemblMolecule.moleculeSynonyms.length > i; i++) {
        if (widget._chemblMolecule.moleculeSynonyms
                .elementAt(i)
                .moleculeSynonym !=
            null) {
          if (!lista.contains(widget._chemblMolecule.moleculeSynonyms
              .elementAt(i)
              .moleculeSynonym)) {
            listaNomes = listaNomes + "" +  widget._chemblMolecule.moleculeSynonyms.elementAt(i).moleculeSynonym +     "\n";
            lista.add(widget._chemblMolecule.moleculeSynonyms
                .elementAt(i)
                .moleculeSynonym);
          }
          if (lista.length >= 5) {
            break;
          }
        }
      }
    } else {
      listaNomes = "Sem sinonimos";
    }

    if (widget._chemblMolecule.moleculeProperties != null) {
      if (widget._chemblMolecule.moleculeProperties.fullMolformula != null) {
        formula = widget._chemblMolecule.moleculeProperties.fullMolformula;
      }
    }

    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 14.0);
    var planetCardContent = new Container(
        margin: new EdgeInsets.fromLTRB(16, 16.0, 16.0, 16.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[]));

    var planetCardContent2 = new Flexible(
      child: new Column(
        children: <Widget>[
          new Text(
              "CHEMBLID: " +
                  widget._chemblMolecule.moleculeHierarchy.moleculeChemblId,
              style: subHeaderTextStyle),
          new Text("Name: " + widget._chemblMolecule.prefName,
              style: subHeaderTextStyle),
          new Text(
              "Oral: " + (widget._chemblMolecule.oral == true ? "Yes" : "No"),
              style: subHeaderTextStyle),
          new Text("Formula: " + formula, style: subHeaderTextStyle),
          new Text("Synonym: " + listaNomes, style: subHeaderTextStyle),
          new Text("PubMed : " + trabalhosPubmed + " references",
              style: subHeaderTextStyle),
        ],
      ),
    );

    final planetCard = new Container(
      child: new Column(
        children: <Widget>[planetCardContent2],
      ),
      width: MediaQuery.of(context).size.height,
      margin: new EdgeInsets.only(left: 1),
      decoration: new BoxDecoration(
        color: new Color(0xFA333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return new GestureDetector(
      child: Center(
          child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: planetCard)),
      onTap: () => criatela(widget._chemblMolecule.prefName)
    );
  }

  criatela(String prefName) {
    Navigator.pushNamed(context, "/pubmedscreen", arguments: prefName);
  }
}
