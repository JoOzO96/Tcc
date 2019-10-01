import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:unidb/Classes/ClinicalTrials/FullStudies.dart';
import 'package:unidb/Classes/ClinicalTrials/Study.dart';
import 'package:unidb/clinicalestudo.dart';

class StudyCard extends StatefulWidget {
  final FullStudies study;

  StudyCard(this.study);

  @override
  _StudyCardState createState() => _StudyCardState();
}

class _StudyCardState extends State<StudyCard> {
  bool segue = false;

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);
    var planetCardContent = new Container(
        margin: new EdgeInsets.fromLTRB(16, 16.0, 16.0, 16.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[]));
    if (widget.study.study.protocolSection.statusModule.lastKnownStatus !=
        null) {
      planetCardContent = new Container(
        margin: new EdgeInsets.fromLTRB(16, 16.0, 16.0, 16.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(height: 2.0),
            new Text(
                "Resumo Título:" +
                    widget.study.study.protocolSection.identificationModule
                        .briefTitle,
                style: subHeaderTextStyle),
            new Text(
                "Realizado por:" +
                    widget.study.study.protocolSection.identificationModule
                        .organization.orgFullName,
                style: subHeaderTextStyle),
            new Text(
                "Status:" +
                    widget.study.study.protocolSection.statusModule
                        .lastKnownStatus,
                style: subHeaderTextStyle),
          ],
        ),
      );
    } else {
      planetCardContent = new Container(
        margin: new EdgeInsets.fromLTRB(16, 16.0, 16.0, 16.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(height: 2.0),
            new Text(
                "Resumo Título:" +
                    widget.study.study.protocolSection.identificationModule
                        .briefTitle,
                style: subHeaderTextStyle),
            new Text(
                "Realizado por:" +
                    widget.study.study.protocolSection.identificationModule
                        .organization.orgFullName,
                style: subHeaderTextStyle),
            new Text("Status: Não informado", style: subHeaderTextStyle),
          ],
        ),
      );
    }

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
        onTap: () => criatela(widget.study.study));
  }

  criatela(Study study) {
    Navigator.pushNamed(context, "/clinicalestudo",
        arguments: study);
  }
}
