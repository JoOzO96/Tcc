import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unidb/Classes/Estrutura.dart';
import 'package:unidb/Consulta_Row.dart';
import 'package:xml/xml.dart' as xml;

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  final TextEditingController _filter = new TextEditingController();
  // final dio = new Dio(); // for http requests
  String _searchText = "";
  List names = new List(); // names we get from API
  List filteredNames = new List(); // names filtered by search text
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Buscar PDB ID');
  bool consulta = false;
  bool consultaConcluida = false;
  var resposta = "";

  List<Estrutura> itemsList = new List();
  parsing(xmlRecebido) {
    var document = xml.parse(xmlRecebido);
    //print(document.toString());
    //print(document.toXmlString(pretty: true, indent: '\t'));
    Iterable<xml.XmlElement> items = document.findAllElements('record');
    items.map((xml.XmlElement item) {
      Estrutura estrutura = new Estrutura(
          getValue(item.findElements("dimStructure.structureId")),
          getValue(item.findElements("dimStructure.releaseDate")),
          getValue(item.findElements("dimStructure.pubmedId")),
          getValue(item.findElements("dimStructure.doi")));
      itemsList.add(estrutura);
    }).toList();
  }

  getValue(Iterable<xml.XmlElement> items) {
    var textValue;
    items.map((xml.XmlElement node) {
      textValue = node.text;
    }).toList();
    return textValue;
  }

  realizaConsulta() async {
    var url = "https://www.rcsb.org/pdb/rest/customReport.xml?pdbids=" +
        _filter.text +
        "&customReportColumns=structureId,releaseDate,structureAuthor,pubmedId,doi&primaryOnly=1";

    // Await the http get response, then decode the json-formatted responce.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      resposta = response.body;
      parsing(resposta);
      setState(() {
        consultaConcluida = true;
      });
    } else {
      setState(() {
        consultaConcluida = false;
      });
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.send);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'PDB ID...'),
        );
      } else {
        if (_filter.text != "") {
          itemsList.clear();
          setState(() {
            consulta = true;
            realizaConsulta();
          });
        } else {
          setState(() {
            consultaConcluida = false;
            consulta = false;
          });
          this._searchIcon = new Icon(Icons.search);
          this._appBarTitle = new Text('Buscar PDB ID');
          filteredNames = names;
          _filter.clear();
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();

    if (consulta) {
      realizaConsulta();
    }
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: () => _searchPressed(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (consulta && consultaConcluida) {
      consulta = false;
      consultaConcluida = false;
      return new Scaffold(
          appBar: _buildBar(context),
          body: new Column(
            children: <Widget>[
              new Container(
                  child: new Flexible(
                      child: new CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: <Widget>[
                  new SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 3.0,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1,
                    ),
                    delegate: new SliverChildBuilderDelegate(
                      (context, index) => new ConsultaRow(itemsList[index]),
                      childCount: itemsList.length,
                    ),
                  ),
                ],
              )))
            ],
          ));
    } else if (consulta == true && consultaConcluida == false) {
      return new Scaffold(
          appBar: _buildBar(context),
          body: new Center(
              child: new Column(
            children: <Widget>[
              new CircularProgressIndicator(),
              new Text("Realizando consulta nos bancos de dados..."),
            ],
          )));
    } else {
      return new Scaffold(
          appBar: _buildBar(context),
          body: new Column(
            children: <Widget>[],
          ));
    }
  }

  // @override
  // List<Widget> buildActions(BuildContext context) {
  //   // TODO: implement buildActions
  //   return null;
  // }

  // @override
  // Widget buildLeading(BuildContext context) {
  //   // TODO: implement buildLeading
  //   return null;
  // }

  // @override
  // Widget buildResults(BuildContext context) {
  //   // TODO: implement buildResults
  //   return null;
  // }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // TODO: implement buildSuggestions
  //   return null;
  // }
}
