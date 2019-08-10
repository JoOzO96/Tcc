import 'package:flutter/material.dart';
import 'package:unidb/Classes/ClinicalTrials/Study.dart';
import 'package:unidb/ClinicalTrials_Estudos.dart';

class ClinicalEstudoScreen extends StatefulWidget {
  final Study study;
  ClinicalEstudoScreen(this.study);
  @override
  ClinicalEstudoScreenState createState() => new ClinicalEstudoScreenState();
}

class ClinicalEstudoScreenState extends State<ClinicalEstudoScreen> {
  @override
  Widget build(BuildContext context) {
    // return new SafeArea(
    //     child: Scaffold(

    //   body: new Center(
    //     child: new Column(
    //       children: <Widget>[
    //         new Container(
    //                 child: new Flexible(
    //                     child: new CustomScrollView(
    //               scrollDirection: Axis.vertical,
    //               slivers: <Widget>[
    //                 new SliverGrid(
    //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                     crossAxisCount: 1,
    //                     childAspectRatio: 2.0,
    //                     crossAxisSpacing: 1.0,
    //                     mainAxisSpacing: 1,
    //                   ),
    //                   delegate: new SliverChildBuilderDelegate(
    //                     (context, index) =>
    //                         new ClinicalTrialsEstudo(widget.study),
    //                     // new ConsultaRow(itemsList[index]),
    //                     childCount: 1,
    //                   ),

    //                 ),
    //               ],
    //             ))),
    //       ],
    //     ),
    //   ),
    // ));
    Card dados = new Card(

    );

    return new SafeArea(
        child: new Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            
          ],
        )
      ),
    ));
  }
}
