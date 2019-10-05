import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:unidb/Classes/chembl/chemblmolecule.dart';

class ChemblCard extends StatefulWidget {
  final ChemblMolecule _chemblMolecule;
  ChemblCard(this._chemblMolecule);

  @override
  _ChemblCardState createState() => _ChemblCardState();
}

class _ChemblCardState extends State<ChemblCard> {
  bool segue = false;
  String listaNomes;
  @override
  Widget build(BuildContext context) {
    if (widget._chemblMolecule.molecule.moleculeSynonyms != null) {
      for (int i = 0;
          widget._chemblMolecule.molecule.moleculeSynonyms.synonym.length > i;
          i++) {
        listaNomes = "" +
            widget._chemblMolecule.molecule.moleculeSynonyms.synonym
                .elementAt(i)
                .moleculeSynonym +
            "\n";
      }
    }else{
      listaNomes = "Sem sinonimos";
    }

    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);
    var planetCardContent = new Container(
        margin: new EdgeInsets.fromLTRB(16, 16.0, 16.0, 16.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[]));

    planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(16, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 2.0),
          new Text(
              "CHEMBLID: " +
                  widget._chemblMolecule.molecule.moleculeHierarchy
                      .moleculeChemblId,
              style: subHeaderTextStyle),
          new Text("Nome: " + widget._chemblMolecule.molecule.prefName,
              style: subHeaderTextStyle),
          new Text(
              "Administração oral: " +
                  (widget._chemblMolecule.molecule.oral == true
                      ? "Sim"
                      : "Não"),
              style: subHeaderTextStyle),
          new Text(
              "Fórmula: " +
                  widget._chemblMolecule.molecule.moleculeProperties
                      .fullMolformula,
              style: subHeaderTextStyle),
          new Text("Sinonimos: " + listaNomes, style: subHeaderTextStyle)
          // new Text("Simbolo: " + widget.disgenet.geneSymbol,
          //     style: subHeaderTextStyle),
          // new Text("Score: " + widget.disgenet.score.toString(),
          //     style: subHeaderTextStyle),
        ],
      ),
    );

    final planetCard = new Container(
      child: planetCardContent,
      width: MediaQuery.of(context).size.height,
      height: 130,
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
              height: 130,
              margin: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: planetCard)),
    );
  }

  criatela(String uniprotid) {
    Navigator.pushNamed(context, "/drugtargetscreen", arguments: uniprotid);
  }
}
