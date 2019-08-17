import 'package:flutter/material.dart';
import 'package:unidb/Classes/ClinicalTrials/StdAgeList.dart';
import 'package:unidb/Classes/ClinicalTrials/Study.dart';
import 'package:unidb/ClinicalTrials_Estudos.dart';

import 'Classes/ClinicalTrials/Collaborator.dart';

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
              ],
            )));
  }
}
