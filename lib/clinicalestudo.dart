import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:unidb/Classes/ClinicalTrials/Study.dart';
import 'package:unidb/Classes/disgenet/Disgenet.dart';
import 'package:unidb/Classes/umls/umls.dart';
import 'package:unidb/drugtarget.dart';
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
  List<Disgenet> disgenet0 = new List();
  Future<List<Disgenet>> disgenet1;
  Future<List<Disgenet>> disgenet2;
  Future<List<Disgenet>> disgenet3;
  Future<List<Disgenet>> disgenet4;
  Future<List<Disgenet>> disgenet5;
  List<Disgenet> disgenet1Final;
  List<Disgenet> disgenet2Final;
  List<Disgenet> disgenet3Final;
  List<Disgenet> disgenet4Final;
  List<Disgenet> disgenet5Final;
  bool controle0 = false;
  bool controle1 = true;
  bool controle2 = true;
  bool controle3 = true;
  bool controle4 = true;
  bool controle5 = true;
  bool consultaDisgenet = false;
  List<String> listCondicaoParticipantes = new List();
  @override
  void initState() {
    super.initState();

    if (montarTela) {
      setState(() {
        montarTela = false;
      });
      montaTela();
    }
  }

  Future<List<Disgenet>> criaTicketDisgenet(String doenca) async {
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
      disgenet0 = disgenetFromJson(resposta);
      disgenet0.sort((a, b) => b.score.compareTo(a.score));
    }
    setState(() {
      controle0 = true;
    });
    disgenet0 = disgenet0.where((p) => p.score > 0.5).toList();
    if (disgenet0.length > 50) {
      return disgenet0.sublist(0, 50);
    } else {
      return disgenet0;
    }
  }

  montaTela() {
    montarTela = false;
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
      listCondicaoParticipantes = widget
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
      if (listCondicaoParticipantes.length > 0) {
        controle1 = false;
        disgenet1 = criaTicketDisgenet(listCondicaoParticipantes.elementAt(0));
        disgenet1.then((resultList) {
          setState(() {
            controle1 = true;
            if (controle1 &&
                controle2 &&
                controle3 &&
                controle4 &&
                controle5 &&
                controle0) {
              consultaDisgenet = true;
            }
            disgenet1Final = resultList;
          });
        });
        if (listCondicaoParticipantes.length > 1) {
          controle2 = false;
          disgenet2 =
              criaTicketDisgenet(listCondicaoParticipantes.elementAt(1));
          disgenet2.then((resultList) {
            setState(() {
              controle2 = true;
              if (controle1 &&
                  controle2 &&
                  controle3 &&
                  controle4 &&
                  controle5 &&
                  controle0) {
                consultaDisgenet = true;
              }
              disgenet2Final = resultList;
            });
          });
        }
        if (listCondicaoParticipantes.length > 2) {
          controle3 = false;
          disgenet3 =
              criaTicketDisgenet(listCondicaoParticipantes.elementAt(2));
          disgenet3.then((resultList) {
            setState(() {
              controle3 = true;
              if (controle1 &&
                  controle2 &&
                  controle3 &&
                  controle4 &&
                  controle5 &&
                  controle0) {
                consultaDisgenet = true;
              }
              disgenet3Final = resultList;
            });
          });
        }
        if (listCondicaoParticipantes.length > 3) {
          controle4 = false;
          disgenet4 =
              criaTicketDisgenet(listCondicaoParticipantes.elementAt(3));
          disgenet1.then((resultList) {
            setState(() {
              controle4 = true;
              if (controle1 &&
                  controle2 &&
                  controle3 &&
                  controle4 &&
                  controle5 &&
                  controle0) {
                consultaDisgenet = true;
              }
              disgenet4Final = resultList;
            });
          });
        }
        if (listCondicaoParticipantes.length > 4) {
          controle5 = false;
          disgenet5 =
              criaTicketDisgenet(listCondicaoParticipantes.elementAt(4));
          disgenet5.then((resultList) {
            setState(() {
              controle5 = true;
              if (controle1 &&
                  controle2 &&
                  controle3 &&
                  controle4 &&
                  controle5 &&
                  controle0) {
                consultaDisgenet = true;
              }
              disgenet5Final = resultList;
            });
          });
        }
        print("oi");
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
  }

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: Colors.black87, fontSize: 9.0, fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 20.0);

    if (consultaDisgenet == false) {
      return new Scaffold(
          floatingActionButton:
              new FloatingActionButton(onPressed: () => Navigator.pop(context)),
          body: new SafeArea(
            child: Container(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        TextoWidget(
                            widget.study,
                            nomeParticipantes,
                            condicaoParticipantes,
                            criteriosSelecao,
                            consultaDisgenet),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    } else {
      dadosDisgenet = "\n";
      if (listCondicaoParticipantes.length > 0) {
        dadosDisgenet = " Doença: " + listCondicaoParticipantes.elementAt(0);
        dadosDisgenet = dadosDisgenet + "\n Genes Relacionados: \n";
        for (int i = 0; disgenet1Final.length > i; i++) {
          dadosDisgenet = dadosDisgenet +
              "   " +
              disgenet1Final.elementAt(i).geneSymbol +
              " \n";
        }
      }

      return new Scaffold(
          floatingActionButton: new FloatingActionButton(
            child: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          body: new SafeArea(
            child: Container(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        TextoWidget(
                            widget.study,
                            nomeParticipantes,
                            condicaoParticipantes,
                            criteriosSelecao,
                            consultaDisgenet),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        DoencaWidget(listCondicaoParticipantes.elementAt(0)),
                      ],
                    ),
                  ),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    delegate: new SliverChildBuilderDelegate(
                      (context, index) =>
                          new DisgenetCard(disgenet1Final[index]),
                      childCount: disgenet1Final.length,
                    ),
                  ),
                ],
              ),
            ),
          ));
    }
  }
}

class DoencaWidget extends StatelessWidget {
  final String doenca;
  DoencaWidget(this.doenca);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Text("Disease: " + doenca),
      ],
    );
  }
}

class TextoWidget extends StatelessWidget {
  final Study study;
  final String nomeParticipantes;
  final String condicaoParticipantes;
  final String criteriosSelecao;
  final bool consultaDisgenet;
  TextoWidget(this.study, this.nomeParticipantes, this.condicaoParticipantes,
      this.criteriosSelecao, this.consultaDisgenet);

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: Colors.black87, fontSize: 9.0, fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 20.0);
    if (consultaDisgenet == false) {
      return new Column(
        children: <Widget>[
          new Text(
              "Título: " +
                  study.protocolSection.identificationModule.officialTitle,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text("Realizado por: " + nomeParticipantes,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text(
              "Briefing: " +
                  study.protocolSection.descriptionModule.briefSummary,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text("Classificação para o estudo: " + condicaoParticipantes,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text("Critérios de seleção: " + criteriosSelecao,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text("Dados dos DISGENET: ", style: subHeaderTextStyle),
          new Text(" "),
          new CircularProgressIndicator(),
          new Text("Aguardando dados do DISGENET"),
        ],
      );
    } else {
      return new Column(
        children: <Widget>[
          new Text(
              "Título: " +
                  study.protocolSection.identificationModule.officialTitle,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text("Realizado por: " + nomeParticipantes,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text(
              "Briefing: " +
                  study.protocolSection.descriptionModule.briefSummary,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text("Classificação para o estudo: " + condicaoParticipantes,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text("Critérios de seleção: " + criteriosSelecao,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text("Dados dos DISGENET: ", style: subHeaderTextStyle),
        ],
      );
    }
  }
}
