import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unidb/Classes/chembl/chembl.dart';
import 'package:unidb/Classes/chembl/chemblmolecule.dart';
import 'package:unidb/Classes/pubmed/pubmed.dart';
import 'package:unidb/Classes/pubmed/pubmedid.dart';
import 'package:unidb/chembl.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:unidb/pubmedcard.dart';
import 'package:xml2json/xml2json.dart';

class PubMedAbstractScreen extends StatefulWidget {
  final String id;
  PubMedAbstractScreen(this.id);
  @override
  PubMedAbstractScreenState createState() => new PubMedAbstractScreenState();
}

class PubMedAbstractScreenState extends State<PubMedAbstractScreen> {
  bool consultaconcluida = false;
  String texto;
  @override
  void initState() {
    super.initState();
    testeconsulta();
  }

  testeconsulta() async {
    var response;
    response = await http.get("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&id=" + widget.id + "&retmode=text&rettype=abstract");
    texto = response.body;
    setState(() {
      consultaconcluida = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (consultaconcluida) {
      return new Scaffold(
        floatingActionButton: new FloatingActionButton(
            child: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context)),
        body: new SafeArea(
            child: Container(
          child:  CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        new Text(texto),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      );
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
                  new Text("Querying...."),
                ],
              ),
            )),
          ));
    }
  }
}
