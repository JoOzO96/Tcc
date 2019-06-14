import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unidb/Classes/Estrutura.dart';

class ConsultaRow extends StatefulWidget {
  final Estrutura estrutura;

  ConsultaRow(this.estrutura);

  @override
  _ConsultaRowState createState() => _ConsultaRowState();
}

class _ConsultaRowState extends State<ConsultaRow> {
  NumberFormat formatter = NumberFormat("0.00");

  bool segue = false;

  @override
  Widget build(BuildContext context) {
    // final planetThumbnail = new Container(
    //   margin: new EdgeInsets.symmetric(horizontal: 16.0),
    //   alignment: FractionalOffset.bottomCenter,
    //   child: new Container(
    //     width: 95.0,
    //     height: 95.0,
    //     decoration: new BoxDecoration(
    //       shape: BoxShape.circle,
    //       image: new DecorationImage(
    //           fit: BoxFit.cover,
    //           image: new NetworkImage(widget.estrutura.urlImagem == null
    //               ? ""
    //               : widget.medico.urlImagem)),
    //     ),
    //   ),
    // );

    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);

    // Widget _planetValue({String value, String image}) {
    //   if (image != "") {
    //     return new Row(children: <Widget>[
    //       new Image.network(
    //         image,
    //         height: 12.0,
    //       ),
    //       new Container(width: 8.0),
    //       new Text("Distancia", style: regularTextStyle),
    //     ]);
    //   } else {
    //     return new Row(children: <Widget>[
    //       // new Image.asset(null, height: 12.0),
    //       new Container(width: 8.0),
    //       new Text("Distancia", style: regularTextStyle),
    //     ]);
    //   }
    // }

    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(16, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 2.0),
          new Text(
              widget.estrutura.structureId +
                  " - Chain: " +
                  widget.estrutura.chainId,
              style: headerTextStyle),
          new Container(height: 10.0),
          new Text("Data publicação:" + widget.estrutura.releaseDate.toString(),
              style: subHeaderTextStyle),
          new Text("Tamanho Cadaeia:" + widget.estrutura.chainLength.toString(),
              style: subHeaderTextStyle),
          new Text("Classificação:" + widget.estrutura.classification.toString(),
              style: subHeaderTextStyle),
          new Text("Núm. de atomos:" + widget.estrutura.atomSiteCount.toString(),
              style: subHeaderTextStyle),
          new Text("Título da Estrutura:" + widget.estrutura.structureTitle.toString(),
              style: subHeaderTextStyle),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
          new Row(
            children: <Widget>[
              // new Expanded(
              //   child: _planetValue(
              //     value: planet.distance,
              //     image: 'assets/img/ic_distance.png')

              // ),
              // new Expanded(
              //   child: _planetValue(
              //     value: planet.gravity,
              //     image: 'assets/img/ic_gravity.png')
              // )
            ],
          ),
        ],
      ),
    );

    final planetCard = new Container(
      child: planetCardContent,
      width: MediaQuery.of(context).size.height,
      height: 200,
      margin: new EdgeInsets.only(left: 1),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
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

    return new Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        child: new Stack(
          children: <Widget>[
            planetCard,
            // planetThumbnail,
          ],
        ));
  }
}
