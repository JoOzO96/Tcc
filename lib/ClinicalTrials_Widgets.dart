// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:unidb/Classes/ClinicalTrials.dart';
// import 'package:unidb/Classes/Estrutura.dart';

// class ClinicalTrialsWidget extends StatefulWidget {
//   final ClinicalTrials _clinicalTrials;
  
//   ClinicalTrialsWidget(this._clinicalTrials);
//   @override
//   _ClinicalTrialsWidgetState createState() => _ClinicalTrialsWidgetState();
// }

// class _ClinicalTrialsWidgetState extends State<ClinicalTrialsWidget> {
//   NumberFormat formatter = NumberFormat("0.00");

//   bool segue = false;

//   @override
//   Widget build(BuildContext context) {
    

//     final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
//     final regularTextStyle = baseTextStyle.copyWith(
//         color: const Color(0xffb6b2df),
//         fontSize: 9.0,
//         fontWeight: FontWeight.w400);
//     final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);
//     final headerTextStyle = baseTextStyle.copyWith(
//         color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);

   

//     final planetCardContent = new Container(
//       margin: new EdgeInsets.fromLTRB(16, 16.0, 16.0, 16.0),
//       constraints: new BoxConstraints.expand(),
//       child: new Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           new Container(height: 2.0),
          
//           new Text("Expressão:" + widget._clinicalTrials..expression.toString(),
//               style: subHeaderTextStyle),
         
//         ],
//       ),
//     );

//     final planetCard = new Container(
//       child: planetCardContent,
//       width: MediaQuery.of(context).size.height,
//       height: 200,
//       margin: new EdgeInsets.only(left: 1),
//       decoration: new BoxDecoration(
//         color: new Color(0xFF333366),
//         shape: BoxShape.rectangle,
//         borderRadius: new BorderRadius.circular(8.0),
//         boxShadow: <BoxShadow>[
//           new BoxShadow(
//             color: Colors.black12,
//             blurRadius: 10.0,
//             offset: new Offset(0.0, 10.0),
//           ),
//         ],
//       ),
//     );

//     return new Container(
//         height: 120.0,
//         margin: const EdgeInsets.symmetric(
//           vertical: 16.0,
//           horizontal: 16.0,
//         ),
//         child: new Stack(
//           children: <Widget>[
//             planetCard,
//             // planetThumbnail,
//           ],
//         ));
//   }
// }
