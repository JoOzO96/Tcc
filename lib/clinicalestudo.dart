import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:unidb/Classes/ClinicalTrials/Study.dart';
import 'package:unidb/Classes/disgenet/Disgenet.dart';
import 'package:unidb/Classes/umls/umls.dart';
import 'Classes/ClinicalTrials/Collaborator.dart';
import 'package:http/http.dart' as http;

class ClinicalEstudoScreen extends StatefulWidget {
  final Study study;
  ClinicalEstudoScreen(this.study);
  @override
  ClinicalEstudoScreenState createState() => new ClinicalEstudoScreenState();
}

class ClinicalEstudoScreenState extends State<ClinicalEstudoScreen> {
  String nomeParticipantes = "";
  String condicaoParticipantes = "";
  String criteriosSelecao = "";
  String dadosDisgenet = "";
  bool montarTela = true;
  List<Disgenet> disgenet = new List();
  bool consultaDisgenet = false;
  @override
  void initState() {
    super.initState();

    if (montarTela){
      setState(() {
       montarTela = false; 
      });
      montaTela();
    }
  }

  criaTicketDisgenet(String doenca) async {
    var response;

    response = await http.post("https://utslogin.nlm.nih.gov/cas/v1/tickets",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: "username=josealcides&password=Alcides%40jose1",
        encoding: Encoding.getByName("utf-8"));
    if (response.statusCode == 201) {
      dom.Document document = parser.parse(response.body);
      var tgt = document.body.nodes.elementAt(1).attributes.values.elementAt(0);
      response = await http.post(tgt,
          headers: {"Content-Type": "application/x-www-form-urlencoded"},
          body: "service=http://umlsks.nlm.nih.gov",
          encoding: Encoding.getByName("utf-8"));
      var ticket = response.body;

      response = await http.post(tgt,
          headers: {"Content-Type": "application/x-www-form-urlencoded"},
          body: "service=http://umlsks.nlm.nih.gov",
          encoding: Encoding.getByName("utf-8"));
      ticket = response.body;

      response = await http.get(
          "https://uts-ws.nlm.nih.gov/rest/search/current?string=" +
              doenca +
              "&ticket=" +
              ticket);
      var resposta = response.body;
      Map userMap = json.decode(resposta);
      Umls umls = Umls.fromJson(userMap);

      response = await http.get("http://www.disgenet.org/api/gda/disease/" +
          umls.result.results.elementAt(0).ui +
          "?format=json");
      resposta = "";
      resposta = response.body;
      disgenet = disgenetFromJson(resposta);
      setState(() {
       consultaDisgenet = true; 
      });
    }
  }

  montaTela() {
    montarTela = false;
    if (widget.study.protocolSection.sponsorCollaboratorsModule.collaboratorList !=
        null) {
      List<Collaborator> listParticipantes = widget.study.protocolSection
          .sponsorCollaboratorsModule.collaboratorList.collaborator
          .toList();
      for (int i = 0; i < listParticipantes.length; i++) {
        if ((i + 2) == listParticipantes.length) {
          nomeParticipantes +=
              listParticipantes.elementAt(i).collaboratorName + " e ";
        } else {
          nomeParticipantes +=
              listParticipantes.elementAt(i).collaboratorName + ", ";
        }
      }
    } else {
      nomeParticipantes = "Não informado.";
    }

    if (widget.study.protocolSection.sponsorCollaboratorsModule
            .collaboratorList !=
        null) {
      List<String> listCondicaoParticipantes = widget
          .study.protocolSection.conditionsModule.conditionList.condition
          .toList();
      for (int i = 0; i < listCondicaoParticipantes.length; i++) {
        if ((i + 2) == listCondicaoParticipantes.length) {
          condicaoParticipantes +=
              listCondicaoParticipantes.elementAt(i) + " e ";
        } else {
          condicaoParticipantes +=
              listCondicaoParticipantes.elementAt(i) + ", ";
        }
      }
      criaTicketDisgenet(listCondicaoParticipantes.elementAt(0));
    } else {
      condicaoParticipantes = "Não informado.";
    }

    if (widget.study.protocolSection.eligibilityModule != null) {
      if (widget.study.protocolSection.eligibilityModule.healthyVolunteers !=
          null) {
        criteriosSelecao += "\nVoluntários: " +
            widget.study.protocolSection.eligibilityModule.healthyVolunteers;
      }
      if (widget.study.protocolSection.eligibilityModule.gender != null) {
        criteriosSelecao +=
            "\nSexo: " + widget.study.protocolSection.eligibilityModule.gender;
      }
      if (widget.study.protocolSection.eligibilityModule.minimumAge != null) {
        criteriosSelecao += "\nIdade minima: " +
            widget.study.protocolSection.eligibilityModule.minimumAge;
      }
      if (widget.study.protocolSection.eligibilityModule.maximumAge != null) {
        criteriosSelecao += "\nIdade máxima: " +
            widget.study.protocolSection.eligibilityModule.maximumAge;
      }
      if (widget.study.protocolSection.eligibilityModule.stdAgeList.stdAge !=
          null) {
        criteriosSelecao += "\n";
        List<String> listIdade = widget
            .study.protocolSection.eligibilityModule.stdAgeList.stdAge
            .toList();
        for (int i = 0; i < listIdade.length; i++) {
          if ((i + 2) == listIdade.length) {
            criteriosSelecao += listIdade.elementAt(i) + " e ";
          } else {
            criteriosSelecao += listIdade.elementAt(i) + ", ";
          }
        }
      }
      if (widget.study.protocolSection.eligibilityModule.eligibilityCriteria !=
          null) {
        criteriosSelecao += "\n" +
            widget.study.protocolSection.eligibilityModule.eligibilityCriteria;
      }
    } else {
      criteriosSelecao = "\nNão informado.";
    }
  }

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: Colors.black87, fontSize: 9.0, fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 20.0);
    if (consultaDisgenet == false) {
      return new Scaffold(
          floatingActionButton: new FloatingActionButton(
            onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
          ),
          body: new Container(
              color: Colors.white,
              child: new ListView(
                children: <Widget>[
                  new Text(
                      "Título: " +
                          widget.study.protocolSection.identificationModule
                              .officialTitle,
                      style: subHeaderTextStyle),
                  new Text(" "),
                  new Text("Realizado por: " + nomeParticipantes,
                      style: subHeaderTextStyle),
                  new Text(" "),
                  new Text(
                      "Briefing: " +
                          widget.study.protocolSection.descriptionModule
                              .briefSummary,
                      style: subHeaderTextStyle),
                  new Text(" "),
                  new Text(
                      "Classificação para o estudo: " + condicaoParticipantes,
                      style: subHeaderTextStyle),
                  new Text(" "),
                  new Text("Critérios de seleção: " + criteriosSelecao,
                      style: subHeaderTextStyle),
                  new Text(" "),
                  new Text("Dados dos DISGENET: ", style: subHeaderTextStyle),
                  new CircularProgressIndicator(),
                  new Text("Agurdando dados..."),
                  new Text(" "),
                  new Text(" "),
                  new Text(" "),
                  new Text(" ")
                ],
              )));
    } else {
      dadosDisgenet = "\n";
      for (int i = 0; i < disgenet.length; i++) {
        dadosDisgenet += disgenet.elementAt(i).geneSymbol.toString() +
            " - " +
            disgenet.elementAt(i).proteinClassName.toString() +
            "\n";
      }

      return new Scaffold(
          floatingActionButton: new FloatingActionButton(
            onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
          ),
          body: new Container(
              color: Colors.white,
              child: new ListView(
                children: <Widget>[
                  new Text(
                      "Título: " +
                          widget.study.protocolSection.identificationModule
                              .officialTitle,
                      style: subHeaderTextStyle),
                  new Text(" "),
                  new Text("Realizado por: " + nomeParticipantes,
                      style: subHeaderTextStyle),
                  new Text(" "),
                  new Text(
                      "Briefing: " +
                          widget.study.protocolSection.descriptionModule
                              .briefSummary,
                      style: subHeaderTextStyle),
                  new Text(" "),
                  new Text(
                      "Classificação para o estudo: " + condicaoParticipantes,
                      style: subHeaderTextStyle),
                  new Text(" "),
                  new Text("Critérios de seleção: " + criteriosSelecao,
                      style: subHeaderTextStyle),
                  new Text(" "),
                  new Text("Dados dos DISGENET: ", style: subHeaderTextStyle),
                  new Text("Genes relacionados:" + dadosDisgenet,
                      style: subHeaderTextStyle),
                  new Text(" "),
                  new Text(" "),
                  new Text(" "),
                ],
              )));
    }
  }
}
