import 'package:flutter/material.dart';
import 'package:unidb/Classes/ClinicalTrials.dart';

class ClinicalTrialsScreen extends StatefulWidget {
  @override
  ClinicalTrialsScreenState createState() => new ClinicalTrialsScreenState();
}

class ClinicalTrialsScreenState extends State<ClinicalTrialsScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: Scaffold(
          floatingActionButton: new FloatingActionButton(onPressed: () => Navigator.pushReplacementNamed(context, "/home"),),
      body: new Center(
        child: new Column(
          children: <Widget>[
            

          ],
        ),
      ),
    ));
  }
}