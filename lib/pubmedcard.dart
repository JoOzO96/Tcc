// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:unidb/Classes/pubmed/pubmedid.dart';

// class PubMedCard extends StatefulWidget {
//   final PubmedArticle pubmedarticle;
//   PubMedCard(this.pubmedarticle);

//   @override
//   _PubMedCardState createState() => _PubMedCardState();
// }

// class _PubMedCardState extends State<PubMedCard> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
//     final regularTextStyle = baseTextStyle.copyWith(
//         color: const Color(0xffb6b2df),
//         fontSize: 9.0,
//         fontWeight: FontWeight.w400);
//     final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 14.0);
//     var planetCardContent = new Container(
//         margin: new EdgeInsets.fromLTRB(16, 16.0, 16.0, 16.0),
//         constraints: new BoxConstraints.expand(),
//         child: new Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[]));

//     var planetCardContent2 = new Flexible(
//         child: new Container(
//       margin: new EdgeInsets.fromLTRB(16, 16.0, 16.0, 16.0),
//       constraints: new BoxConstraints.expand(),
//       child: new Column(
//         children: <Widget>[
//           new Text(
//               "Title: " +
//                   widget
//                       .pubmedarticle.medlineCitation.article.articleTitle.empty,
//               style: subHeaderTextStyle),
//           new Text(
//               "Publication Date: " +
//                   widget.pubmedarticle.medlineCitation.article.journal
//                       .journalIssue.pubDate.day,
//               style: subHeaderTextStyle),
//           // new Text(
//           //     "Oral: " + (widget._chemblMolecule.oral == true ? "Yes" : "No"),
//           //     style: subHeaderTextStyle),
//           // new Text("Formula: " + formula, style: subHeaderTextStyle),
//           // new Text("Synonym: " + listaNomes, style: subHeaderTextStyle),
//           // new Text("PubMed : " + trabalhosPubmed + " references",
//           //     style: subHeaderTextStyle),
//         ],
//       ),
//     ));

//     final planetCard = new Container(
//       child: new Column(
//         children: <Widget>[planetCardContent2],
//       ),
//       width: MediaQuery.of(context).size.height,
//       margin: new EdgeInsets.only(left: 1),
//       decoration: new BoxDecoration(
//         color: new Color(0xFA333366),
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

//     return new GestureDetector(
//       child: Container(
//           margin: const EdgeInsets.symmetric(
//             vertical: 16.0,
//             horizontal: 16.0,
//           ),
//           child: planetCard),
//     );
//   }
// }
