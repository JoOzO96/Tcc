import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:unidb/Classes/ClinicalTrials/Study.dart';
import 'package:unidb/Classes/disgenet/Disgenet.dart';
import 'package:unidb/Classes/umls/umls.dart';
import 'package:unidb/drugtarget.dart';

import 'Classes/ClinicalTrials/Collaborator.dart';

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
  bool naoPossuiLista = true;
  bool naoPossuiLista1 = false;
  bool naoPossuiLista2 = false;
  bool naoPossuiLista3 = false;
  bool naoPossuiLista4 = false;
  bool naoPossuiLista5 = false;
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
  bool controle1Final = false;
  bool controle2Final = false;
  bool controle3Final = false;
  bool controle4Final = false;
  bool controle5Final = false;
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
      print("http://www.disgenet.org/api/gda/disease/" +
          umls.result.results.elementAt(0).ui +
          "?format=json");
      resposta = "";
      resposta = response.body;

      if (resposta.toString().contains("errors")) {
        disgenet0 = new List();
      } else {
        disgenet0 = disgenetFromJson(resposta);
        disgenet0.sort((a, b) => b.score.compareTo(a.score));
        disgenet0 = disgenet0.where((p) => p.score > 0.5).toList();
      }
    }
    setState(() {
      controle0 = true;
    });

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
      setState(() {
        naoPossuiLista = false;
      });
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
            controle1Final = true;
            if (disgenet1Final.length == 0) {
              naoPossuiLista1 = true;
            }
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
              controle2Final = true;
              if (disgenet2Final.length == 0) {
                naoPossuiLista2 = true;
              }
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
              controle3Final = true;
              if (disgenet3Final.length == 0) {
                naoPossuiLista4 = true;
              }
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
              controle4Final = true;
              if (disgenet4Final.length == 0) {
                naoPossuiLista4 = true;
              }
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
              controle5Final = true;
              if (disgenet5Final.length == 0) {
                naoPossuiLista5 = true;
              }
            });
          });
        }
      }
    } else {
      condicaoParticipantes = "Uninformed.";
      setState(() {
        consultaDisgenet = true;
        naoPossuiLista1 = true;
        naoPossuiLista2 = true;
        naoPossuiLista3 = true;
        naoPossuiLista4 = true;
        naoPossuiLista5 = true;
      });
    }

    if (widget.study.protocolSection.eligibilityModule != null) {
      if (widget.study.protocolSection.eligibilityModule.healthyVolunteers !=
          null) {
        criteriosSelecao += "\nVolunteers: " +
            widget.study.protocolSection.eligibilityModule.healthyVolunteers;
      }
      if (widget.study.protocolSection.eligibilityModule.gender != null) {
        criteriosSelecao += "\nGender: " +
            widget.study.protocolSection.eligibilityModule.gender;
      }
      if (widget.study.protocolSection.eligibilityModule.minimumAge != null) {
        criteriosSelecao += "\nMinimum Age: " +
            widget.study.protocolSection.eligibilityModule.minimumAge;
      }
      if (widget.study.protocolSection.eligibilityModule.maximumAge != null) {
        criteriosSelecao += "\nMaximum Age: " +
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
      criteriosSelecao = "\nUninformed.";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (naoPossuiLista1 &&
        naoPossuiLista2 &&
        naoPossuiLista3 &&
        naoPossuiLista4 &&
        naoPossuiLista5 &&
        consultaDisgenet) {
      naoPossuiLista = true;
    } else {
      naoPossuiLista = false;
    }

    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: Colors.black87, fontSize: 9.0, fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 20.0);
    if (consultaDisgenet == false && naoPossuiLista == true) {
      return new Scaffold(
          floatingActionButton: new FloatingActionButton(
              child: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context)),
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
                            consultaDisgenet,
                            naoPossuiLista),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    } else {
      if (consultaDisgenet == true && naoPossuiLista == true) {
        return new Scaffold(
            floatingActionButton: new FloatingActionButton(
                child: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context)),
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
                              consultaDisgenet,
                              naoPossuiLista),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      }

      if (consultaDisgenet == false && naoPossuiLista == false) {
        return new Scaffold(
            floatingActionButton: new FloatingActionButton(
                child: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context)),
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
                              consultaDisgenet,
                              naoPossuiLista),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      }

      if (controle1Final == true &&
          controle2Final == false &&
          controle3Final == false &&
          controle4Final == false &&
          controle5Final == false) {
        dadosDisgenet = "\n";

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
                              consultaDisgenet,
                              naoPossuiLista),
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
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          mainAxisSpacing: 6),
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

      if (controle1Final == true &&
          controle2Final == true &&
          controle3Final == false &&
          controle4Final == false &&
          controle5Final == false) {
        dadosDisgenet = "\n";

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
                              consultaDisgenet,
                              naoPossuiLista),
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
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          mainAxisSpacing: 6),
                      delegate: new SliverChildBuilderDelegate(
                        (context, index) =>
                            new DisgenetCard(disgenet1Final[index]),
                        childCount: disgenet1Final.length,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          DoencaWidget(listCondicaoParticipantes.elementAt(1)),
                        ],
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          mainAxisSpacing: 6),
                      delegate: new SliverChildBuilderDelegate(
                        (context, index) =>
                            new DisgenetCard(disgenet2Final[index]),
                        childCount: disgenet2Final.length,
                      ),
                    ),
                  ],
                ),
              ),
            ));
      }

      if (controle1Final == true &&
          controle2Final == true &&
          controle3Final == true &&
          controle4Final == false &&
          controle5Final == false) {
        dadosDisgenet = "\n";

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
                              consultaDisgenet,
                              naoPossuiLista),
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
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          mainAxisSpacing: 6),
                      delegate: new SliverChildBuilderDelegate(
                        (context, index) =>
                            new DisgenetCard(disgenet1Final[index]),
                        childCount: disgenet1Final.length,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          DoencaWidget(listCondicaoParticipantes.elementAt(1)),
                        ],
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          mainAxisSpacing: 6),
                      delegate: new SliverChildBuilderDelegate(
                        (context, index) =>
                            new DisgenetCard(disgenet2Final[index]),
                        childCount: disgenet2Final.length,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          DoencaWidget(listCondicaoParticipantes.elementAt(2)),
                        ],
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          mainAxisSpacing: 6),
                      delegate: new SliverChildBuilderDelegate(
                        (context, index) =>
                            new DisgenetCard(disgenet3Final[index]),
                        childCount: disgenet3Final.length,
                      ),
                    ),
                  ],
                ),
              ),
            ));
      }

      if (controle1Final == true &&
          controle2Final == true &&
          controle3Final == true &&
          controle4Final == true &&
          controle5Final == false) {
        dadosDisgenet = "\n";

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
                              consultaDisgenet,
                              naoPossuiLista),
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
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          mainAxisSpacing: 6),
                      delegate: new SliverChildBuilderDelegate(
                        (context, index) =>
                            new DisgenetCard(disgenet1Final[index]),
                        childCount: disgenet1Final.length,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          DoencaWidget(listCondicaoParticipantes.elementAt(1)),
                        ],
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          mainAxisSpacing: 6),
                      delegate: new SliverChildBuilderDelegate(
                        (context, index) =>
                            new DisgenetCard(disgenet2Final[index]),
                        childCount: disgenet2Final.length,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          DoencaWidget(listCondicaoParticipantes.elementAt(2)),
                        ],
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          mainAxisSpacing: 6),
                      delegate: new SliverChildBuilderDelegate(
                        (context, index) =>
                            new DisgenetCard(disgenet3Final[index]),
                        childCount: disgenet3Final.length,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          DoencaWidget(listCondicaoParticipantes.elementAt(3)),
                        ],
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          mainAxisSpacing: 6),
                      delegate: new SliverChildBuilderDelegate(
                        (context, index) =>
                            new DisgenetCard(disgenet4Final[index]),
                        childCount: disgenet4Final.length,
                      ),
                    ),
                  ],
                ),
              ),
            ));
      }
      if (controle1Final == true &&
          controle2Final == true &&
          controle3Final == true &&
          controle4Final == true &&
          controle5Final == true) {
        dadosDisgenet = "\n";

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
                              consultaDisgenet,
                              naoPossuiLista),
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
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          mainAxisSpacing: 6),
                      delegate: new SliverChildBuilderDelegate(
                        (context, index) =>
                            new DisgenetCard(disgenet1Final[index]),
                        childCount: disgenet1Final.length,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          DoencaWidget(listCondicaoParticipantes.elementAt(1)),
                        ],
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          mainAxisSpacing: 6),
                      delegate: new SliverChildBuilderDelegate(
                        (context, index) =>
                            new DisgenetCard(disgenet2Final[index]),
                        childCount: disgenet2Final.length,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          DoencaWidget(listCondicaoParticipantes.elementAt(2)),
                        ],
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          mainAxisSpacing: 6),
                      delegate: new SliverChildBuilderDelegate(
                        (context, index) =>
                            new DisgenetCard(disgenet3Final[index]),
                        childCount: disgenet3Final.length,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          DoencaWidget(listCondicaoParticipantes.elementAt(4)),
                        ],
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          mainAxisSpacing: 6),
                      delegate: new SliverChildBuilderDelegate(
                        (context, index) =>
                            new DisgenetCard(disgenet5Final[index]),
                        childCount: disgenet5Final.length,
                      ),
                    ),
                  ],
                ),
              ),
            ));
      }
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
  final bool naoPossuiLista;
  TextoWidget(this.study, this.nomeParticipantes, this.condicaoParticipantes,
      this.criteriosSelecao, this.consultaDisgenet, this.naoPossuiLista);

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
              "Title: " +
                  study.protocolSection.identificationModule.officialTitle,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text("Performed by: " + nomeParticipantes,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text(
              "Briefing: " +
                  study.protocolSection.descriptionModule.briefSummary,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text("Classification for the study: " + condicaoParticipantes,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text("Selection Criteria: " + criteriosSelecao,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text("DISGENET: ", style: subHeaderTextStyle),
          new Text(" "),
          new CircularProgressIndicator(),
          new Text("Waiting data from DISGENET"),
        ],
      );
    } else {
      if (naoPossuiLista == true) {
        return new Column(
          children: <Widget>[
            new Text(
                "Title: " +
                    study.protocolSection.identificationModule.officialTitle,
                style: subHeaderTextStyle),
            new Text(" "),
            new Text("Performed by: " + nomeParticipantes,
                style: subHeaderTextStyle),
            new Text(" "),
            new Text(
                "Briefing: " +
                    study.protocolSection.descriptionModule.briefSummary,
                style: subHeaderTextStyle),
            new Text(" "),
            new Text("Classification for the study: " + condicaoParticipantes,
                style: subHeaderTextStyle),
            new Text(" "),
            new Text("Selection Criteria: " + criteriosSelecao,
                style: subHeaderTextStyle),
            new Text(" "),
            new Text("DISGENET: ", style: subHeaderTextStyle),
            new Text(" "),
            new Text("No data from DISGENET"),
            new Text(" "),
            new Text(" "),
            new Text(" "),
          ],
        );
      }
      return new Column(
        children: <Widget>[
          new Text(
              "Title: " +
                  study.protocolSection.identificationModule.officialTitle,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text("Performed by: " + nomeParticipantes,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text(
              "Briefing: " +
                  study.protocolSection.descriptionModule.briefSummary,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text("Classification for the study: " + condicaoParticipantes,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text("Selection Criteria: " + criteriosSelecao,
              style: subHeaderTextStyle),
          new Text(" "),
          new Text("DISGENET: ", style: subHeaderTextStyle),
          new Text(" "),
        ],
      );
    }
  }
}
