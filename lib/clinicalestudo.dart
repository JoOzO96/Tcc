import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:unidb/Classes/ClinicalTrials/Study.dart';
import 'Classes/ClinicalTrials/Collaborator.dart';
import 'package:http/http.dart' as http;

class ClinicalEstudoScreen extends StatefulWidget {
  final Study study;
  ClinicalEstudoScreen(this.study);
  @override
  ClinicalEstudoScreenState createState() => new ClinicalEstudoScreenState();
}

class ClinicalEstudoScreenState extends State<ClinicalEstudoScreen> {
  @override
  Widget build(BuildContext context) {
    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: Colors.black87, fontSize: 9.0, fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 20.0);
    String nomeParticipantes = "";
    String condicaoParticipantes = "";
    String criteriosSelecao = "";
    String dadosDisgenet = "";
    @override
    void initState() {
      super.initState();
    }

    criaTicketDisgenet(String doenca) async {
      var response;

      response = await http.post("https://utslogin.nlm.nih.gov/cas/v1/tickets",
          headers: {"Content-Type": "application/x-www-form-urlencoded"},
          body: "username=josealcides&password=Alcides%40jose1",
          encoding: Encoding.getByName("utf-8"));
      if (response.statusCode == 201) {
        dom.Document document = parser.parse(response.body);
        var tgt =
            document.body.nodes.elementAt(1).attributes.values.elementAt(0);
        response = await http.post(tgt,
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
            body: "service=http://umlsks.nlm.nih.gov",
            encoding: Encoding.getByName("utf-8"));
        var ticket = response.body;
        print("https://uts-ws.nlm.nih.gov/rest/search/current?string=" +
                doenca +
                "&ticket=" +
                ticket);
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
        
        print(response.body);
        
      }
    }

    if (widget.study.protocolSection.sponsorCollaboratorsModule
            .collaboratorList !=
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
                new Text("Dados dos DISGENET: " + dadosDisgenet,
                    style: subHeaderTextStyle),
                new Text(" "),
                new Text(" "),
                new Text(" "),
                new Text(" "),
              ],
            )));
  }
}
