import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unidb/Classes/chembl/chembl.dart';
import 'package:unidb/Classes/chembl/chemblmolecule.dart';
import 'package:unidb/Classes/pubmed/pubmed.dart';
import 'package:unidb/chembl.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:xml2json/xml2json.dart';

class PubMedScreen extends StatefulWidget {
  final String uniprot;
  PubMedScreen(this.uniprot);
  @override
  PubMedScreenState createState() => new PubMedScreenState();
}

class PubMedScreenState extends State<PubMedScreen> {
  Etuilspubmed eutilspubmed = new Etuilspubmed();
  bool consultaconcluida = false;
  DateTime dataFim = new DateTime.now();
  DateTime dataInicio = DateTime(1990, 1, 1);
  Xml2Json xml2json = new Xml2Json();
  @override
  void initState() {
    super.initState();
    testeconsulta();
  }

  testeconsulta() async {
    var response;
    response = await http.get(
        "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=" +
            widget.uniprot +
            "&retmax=100&usehistory=y&maxdate=" +
            dataFim.year.toString() +
            "/" +
            dataFim.month.toString() +
            "/" +
            dataFim.day.toString() +
            "&mindate=" +
            dataInicio.year.toString() +
            "/" +
            dataInicio.month.toString() +
            "/" +
            dataInicio.day.toString() +
            "&format=json");
    Map userMap = json.decode(response.body);
    eutilspubmed = Etuilspubmed.fromJson(userMap);

    for (int i = 0; eutilspubmed.esearchresult.idlist.length > i; i++) {
      response = await http.get(
          "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&id=" +
              eutilspubmed.esearchresult.idlist.elementAt(i) +
              "&format=xml");
      xml2json.parse(response.body);
      String teste = xml2json.toBadgerfish();
      print("oi");
    }

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
          child: CustomScrollView(slivers: <Widget>[
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index == 0) {
                    return FlatButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1990, 1, 1),
                              maxTime: DateTime(
                                  new DateTime.now().year,
                                  new DateTime.now().month,
                                  new DateTime.now().day),
                              theme: DatePickerTheme(
                                  backgroundColor: Colors.blue,
                                  itemStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  doneStyle: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                              onChanged: (date) {}, onConfirm: (date) {
                            setState(() {
                              dataInicio = date;
                              consultaconcluida = false;
                              testeconsulta();
                            });
                          }, currentTime: dataInicio, locale: LocaleType.pt);
                        },
                        child: Text(
                          "Data Inicio: " +
                              dataInicio.day.toString() +
                              "/" +
                              dataInicio.month.toString() +
                              "/" +
                              dataInicio.year.toString(),
                          style: TextStyle(color: Colors.blue, fontSize: 13),
                        ));
                  } else {
                    return FlatButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1990, 1, 1),
                              maxTime: DateTime(
                                  new DateTime.now().year,
                                  new DateTime.now().month,
                                  new DateTime.now().day),
                              theme: DatePickerTheme(
                                  backgroundColor: Colors.blue,
                                  itemStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  doneStyle: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                              onChanged: (date) {}, onConfirm: (date) {
                            setState(() {
                              dataFim = date;
                              consultaconcluida = false;
                              testeconsulta();
                            });
                          }, currentTime: dataFim, locale: LocaleType.pt);
                        },
                        child: Text(
                          "Data Fim: " +
                              dataFim.day.toString() +
                              "/" +
                              dataFim.month.toString() +
                              "/" +
                              dataFim.year.toString(),
                          style: TextStyle(color: Colors.blue, fontSize: 13),
                        ));
                  }
                },
                childCount: 2,
              ),
            ),
            // SliverGrid(
            //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //               crossAxisCount: 2, childAspectRatio: 2, mainAxisSpacing: 6),
            //           delegate: new SliverChildBuilderDelegate(
            //             (context, index) =>
            //                 new PubmedCard(eutilspubmed.esearchresult.idlist[index]),
            //             childCount: eutilspubmed.esearchresult.idlist.length,
            //           ),
            //         ),
          ]),
        )),
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
                  new Text("dasdsd"),
                ],
              ),
            )),
          ));
    }
  }
}
