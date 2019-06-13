import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unidb/Classes/Estrutura.dart';
import 'package:unidb/Consulta_Row.dart';
import 'package:xml/xml.dart' as xml;
import 'package:xpath/xpath.dart';

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
      Estrutura estrutura =
          new Estrutura(getValue(item.findElements("structureId")));
      estrutura.atomSiteCount = getValue(item.findElements("atomSiteCount"));
      estrutura.chainId = getValue(item.findElements("chainId"));
      estrutura.structureAuthor =
          getValue(item.findElements("structureAuthor"));
      estrutura.classification = getValue(item.findElements("classification"));
      estrutura.depositionDate = getValue(item.findElements("depositionDate"));
      estrutura.experimentalTechnique =
          getValue(item.findElements("experimentalTechnique"));
      estrutura.macromoleculeType =
          getValue(item.findElements("macromoleculeType"));
      estrutura.ndbId = getValue(item.findElements("ndbId"));
      estrutura.pdbDoi = getValue(item.findElements("pdbDoi"));
      estrutura.releaseDate = getValue(item.findElements("releaseDate"));
      estrutura.residueCount = getValue(item.findElements("residueCount"));
      estrutura.resolution = getValue(item.findElements("resolution"));
      estrutura.revisionDate = getValue(item.findElements("revisionDate"));
      estrutura.structureMolecularWeight =
          getValue(item.findElements("structureMolecularWeight"));
      estrutura.structureTitle = getValue(item.findElements("structureTitle"));
      estrutura.chainLength = getValue(item.findElements("chainLength"));
      estrutura.entityId = getValue(item.findElements("entityId"));
      estrutura.entityMacromoleculeType =
          getValue(item.findElements("entityMacromoleculeType"));
      estrutura.kabschSander = getValue(item.findElements("kabschSander"));
      estrutura.molecularWeight =
          getValue(item.findElements("molecularWeight"));
      estrutura.sequence = getValue(item.findElements("sequence"));
      estrutura.inChI = getValue(item.findElements("InChI"));
      estrutura.inChIKey = getValue(item.findElements("InChIKey"));
      estrutura.ligandFormula = getValue(item.findElements("ligandFormula"));
      estrutura.ligandId = getValue(item.findElements("ligandId"));
      estrutura.ligandImage = getValue(item.findElements("ligandImage"));
      estrutura.ligandMolecularWeight =
          getValue(item.findElements("ligandMolecularWeight"));
      estrutura.ligandName = getValue(item.findElements("ligandName"));
      estrutura.ligandSmiles = getValue(item.findElements("ligandSmiles"));
      estrutura.ec50 = getValue(item.findElements("EC50"));
      estrutura.ic50 = getValue(item.findElements("IC50"));
      estrutura.ka = getValue(item.findElements("Ka"));
      estrutura.kd = getValue(item.findElements("Kd"));
      estrutura.ki = getValue(item.findElements("Ki"));
      estrutura.deltaG = getValue(item.findElements("deltaG"));
      estrutura.deltaH = getValue(item.findElements("deltaH"));
      estrutura.deltaS = getValue(item.findElements("deltaS"));
      estrutura.hetId = getValue(item.findElements("hetId"));
      estrutura.biologicalProcess =
          getValue(item.findElements("biologicalProcess"));
      estrutura.cellularComponent =
          getValue(item.findElements("cellularComponent"));
      estrutura.compound = getValue(item.findElements("compound"));
      estrutura.ecNo = getValue(item.findElements("ecNo"));
      estrutura.expressionHost = getValue(item.findElements("expressionHost"));
      estrutura.molecularFunction =
          getValue(item.findElements("molecularFunction"));
      estrutura.plasmid = getValue(item.findElements("plasmid"));
      estrutura.source = getValue(item.findElements("source"));
      estrutura.taxonomyId = getValue(item.findElements("taxonomyId"));
      estrutura.authorAssignedEntityName =
          getValue(item.findElements("authorAssignedEntityName"));
      estrutura.clusterNumber100 =
          getValue(item.findElements("clusterNumber100"));
      estrutura.clusterNumber30 =
          getValue(item.findElements("clusterNumber30"));
      estrutura.clusterNumber40 =
          getValue(item.findElements("clusterNumber40"));
      estrutura.clusterNumber50 =
          getValue(item.findElements("clusterNumber50"));
      estrutura.clusterNumber70 =
          getValue(item.findElements("clusterNumber70"));
      estrutura.clusterNumber90 =
          getValue(item.findElements("clusterNumber90"));
      estrutura.clusterNumber95 =
          getValue(item.findElements("clusterNumber95"));
      estrutura.entityId = getValue(item.findElements("entityId"));
      estrutura.geneName = getValue(item.findElements("geneName"));
      estrutura.idNum = getValue(item.findElements("idNum"));
      estrutura.rankNumber100 = getValue(item.findElements("rankNumber100"));
      estrutura.rankNumber30 = getValue(item.findElements("rankNumber30"));
      estrutura.rankNumber40 = getValue(item.findElements("rankNumber40"));
      estrutura.rankNumber50 = getValue(item.findElements("rankNumber50"));
      estrutura.rankNumber70 = getValue(item.findElements("rankNumber70"));
      estrutura.rankNumber90 = getValue(item.findElements("rankNumber90"));
      estrutura.rankNumber95 = getValue(item.findElements("rankNumber95"));
      estrutura.synonym = getValue(item.findElements("synonym"));
      estrutura.taxonomy = getValue(item.findElements("taxonomy"));
      estrutura.taxonomyId = getValue(item.findElements("taxonomyId"));
      estrutura.uniprotAcc = getValue(item.findElements("uniprotAcc"));
      estrutura.uniprotAlternativeNames =
          getValue(item.findElements("uniprotAlternativeNames"));
      estrutura.uniprotRecommendedName =
          getValue(item.findElements("uniprotRecommendedName"));
      estrutura.cathDescription =
          getValue(item.findElements("cathDescription"));
      estrutura.cathId = getValue(item.findElements("cathId"));
      estrutura.pfamAccession = getValue(item.findElements("pfamAccession"));
      estrutura.pfamDescription =
          getValue(item.findElements("pfamDescription"));
      estrutura.pfamId = getValue(item.findElements("pfamId"));
      estrutura.scopDomain = getValue(item.findElements("scopDomain"));
      estrutura.scopFold = getValue(item.findElements("scopFold"));
      estrutura.scopId = getValue(item.findElements("scopId"));
      estrutura.crystallizationMethod =
          getValue(item.findElements("crystallizationMethod"));
      estrutura.crystallizationTempK =
          getValue(item.findElements("crystallizationTempK"));
      estrutura.densityMatthews =
          getValue(item.findElements("densityMatthews"));
      estrutura.densityPercentSol =
          getValue(item.findElements("densityPercentSol"));
      estrutura.pdbxDetails = getValue(item.findElements("pdbxDetails"));
      estrutura.phValue = getValue(item.findElements("phValue"));
      estrutura.zPDB = getValue(item.findElements("Z_PDB"));
      estrutura.lengthOfUnitCellLatticeA =
          getValue(item.findElements("lengthOfUnitCellLatticeA"));
      estrutura.lengthOfUnitCellLatticeB =
          getValue(item.findElements("lengthOfUnitCellLatticeB"));
      estrutura.lengthOfUnitCellLatticeC =
          getValue(item.findElements("lengthOfUnitCellLatticeC"));
      estrutura.spaceGroup = getValue(item.findElements("spaceGroup"));
      estrutura.unitCellAngleAlpha =
          getValue(item.findElements("unitCellAngleAlpha"));
      estrutura.unitCellAngleBeta =
          getValue(item.findElements("unitCellAngleBeta"));
      estrutura.unitCellAngleGamma =
          getValue(item.findElements("unitCellAngleGamma"));
      estrutura.collectionDate = getValue(item.findElements("collectionDate"));
      estrutura.collectionTemperature =
          getValue(item.findElements("collectionTemperature"));
      estrutura.device = getValue(item.findElements("device"));
      estrutura.diffractionSource =
          getValue(item.findElements("diffractionSource"));
      estrutura.diffrnId = getValue(item.findElements("diffrnId"));
      estrutura.averageBFactor = getValue(item.findElements("averageBFactor"));
      estrutura.rAll = getValue(item.findElements("rAll"));
      estrutura.rFree = getValue(item.findElements("rFree"));
      estrutura.rObserved = getValue(item.findElements("rObserved"));
      estrutura.rWork = getValue(item.findElements("rWork"));
      estrutura.refinementResolution =
          getValue(item.findElements("refinementResolution"));
      estrutura.highResolutionLimit =
          getValue(item.findElements("highResolutionLimit"));
      estrutura.reflectionsForRefinement =
          getValue(item.findElements("reflectionsForRefinement"));
      estrutura.structureDeterminationMethod =
          getValue(item.findElements("structureDeterminationMethod"));
      estrutura.authors = getValue(item.findElements("authors"));
      estrutura.name = getValue(item.findElements("name"));
      estrutura.version = getValue(item.findElements("version"));
      estrutura.fieldStrength = getValue(item.findElements("fieldStrength"));
      estrutura.manufacturer = getValue(item.findElements("manufacturer"));
      estrutura.model = getValue(item.findElements("model"));
      estrutura.contents = getValue(item.findElements("contents"));
      estrutura.ionicStrength = getValue(item.findElements("ionicStrength"));
      estrutura.ph = getValue(item.findElements("ph"));
      estrutura.pressure = getValue(item.findElements("pressure"));
      estrutura.pressureUnits = getValue(item.findElements("pressureUnits"));
      estrutura.solventSystem = getValue(item.findElements("solventSystem"));
      estrutura.temperature = getValue(item.findElements("temperature"));
      estrutura.type = getValue(item.findElements("type"));
      estrutura.conformerId = getValue(item.findElements("conformerId"));
      estrutura.selectionCriteria =
          getValue(item.findElements("selectionCriteria"));
      estrutura.details = getValue(item.findElements("details"));
      estrutura.method = getValue(item.findElements("method"));
      estrutura.conformerSelectionCriteria =
          getValue(item.findElements("conformerSelectionCriteria"));
      estrutura.totalConformersCalculated =
          getValue(item.findElements("totalConformersCalculated"));
      estrutura.totalConformersSubmitted =
          getValue(item.findElements("totalConformersSubmitted"));
      estrutura.emResolution = getValue(item.findElements("emResolution"));
      estrutura.emDiffractionResolution =
          getValue(item.findElements("emDiffractionResolution"));
      estrutura.reconstructionMethod =
          getValue(item.findElements("reconstructionMethod"));
      estrutura.symmetryType = getValue(item.findElements("symmetryType"));
      estrutura.pointSymmetry = getValue(item.findElements("pointSymmetry"));
      estrutura.aggregationState =
          getValue(item.findElements("aggregationState"));
      estrutura.embedding = getValue(item.findElements("embedding"));
      estrutura.staining = getValue(item.findElements("staining"));
      estrutura.vitrification = getValue(item.findElements("vitrification"));
      estrutura.emdbMap = getValue(item.findElements("emdbMap"));
      estrutura.additionalMap = getValue(item.findElements("additionalMap"));
      estrutura.abstractTextShort =
          getValue(item.findElements("abstractTextShort"));
      estrutura.citationAuthor = getValue(item.findElements("citationAuthor"));
      estrutura.doi = getValue(item.findElements("doi"));
      estrutura.firstPage = getValue(item.findElements("firstPage"));
      estrutura.journalName = getValue(item.findElements("journalName"));
      estrutura.lastPage = getValue(item.findElements("lastPage"));
      estrutura.meshTerms = getValue(item.findElements("meshTerms"));
      estrutura.pmc = getValue(item.findElements("pmc"));
      estrutura.publicationYear =
          getValue(item.findElements("publicationYear"));
      estrutura.pubmedId = getValue(item.findElements("pubmedId"));
      estrutura.title = getValue(item.findElements("title"));
      estrutura.volumeId = getValue(item.findElements("volumeId"));
      estrutura.citationAuthor = getValue(item.findElements("citationAuthor"));
      estrutura.firstPage = getValue(item.findElements("firstPage"));
      estrutura.journalName = getValue(item.findElements("journalName"));
      estrutura.pmc = getValue(item.findElements("pmc"));
      estrutura.publicationYear =
          getValue(item.findElements("publicationYear"));
      estrutura.pubmedId = getValue(item.findElements("pubmedId"));
      estrutura.title = getValue(item.findElements("title"));
      estrutura.volumeId = getValue(item.findElements("volumeId"));
      estrutura.centerInitial = getValue(item.findElements("centerInitial"));
      estrutura.centerName = getValue(item.findElements("centerName"));
      estrutura.projectName = getValue(item.findElements("projectName"));

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
        "&customReportColumns=atomSiteCount,structureAuthor,classification,depositionDate,experimentalTechnique,macromoleculeType,ndbId,pdbDoi,releaseDate,residueCount,resolution,revisionDate," +
        "structureMolecularWeight,structureTitle,chainLength,db_name,entityId,entityMacromoleculeType,kabschSander,molecularWeight,sequence,InChI,InChIKey,ligandFormula,ligandId," +
        "ligandMolecularWeight,ligandName,ligandSmiles,EC50,IC50,Ka,Kd,Ki,deltaG,deltaH,deltaS,hetId,biologicalProcess,cellularComponent,compound,ecNo,expressionHost," +
        "molecularFunction,plasmid,source,taxonomyId,authorAssignedEntityName,clusterNumber100,clusterNumber30,clusterNumber40,clusterNumber50,clusterNumber70,clusterNumber90," +
        "clusterNumber95,entityId,geneName,rankNumber100,rankNumber30,rankNumber40,rankNumber50,rankNumber70,rankNumber90,rankNumber95,synonym,taxonomy,taxonomyId,uniprotAcc," +
        "uniprotAlternativeNames,uniprotRecommendedName,cathDescription,cathId,pfamAccession,pfamDescription,pfamId,scopDomain,scopFold,scopId,crystallizationMethod,crystallizationTempK," +
        "densityMatthews,densityPercentSol,pdbxDetails,phValue,Z_PDB,lengthOfUnitCellLatticeA,lengthOfUnitCellLatticeB,lengthOfUnitCellLatticeC,spaceGroup,unitCellAngleAlpha," +
        "unitCellAngleBeta,unitCellAngleGamma,collectionDate,collectionTemperature,device,diffractionSource,averageBFactor,rAll,rFree,rObserved,rWork,refinementResolution," +
        "highResolutionLimit,reflectionsForRefinement,structureDeterminationMethod,name,version,fieldStrength,manufacturer,model,contents,ionicStrength,ph,pressure,pressureUnits," +
        "solventSystem,temperature,type,conformerId,selectionCriteria,details,method,conformerSelectionCriteria,totalConformersCalculated,totalConformersSubmitted,emResolution," +
        "emDiffractionResolution,reconstructionMethod,symmetryType,pointSymmetry,aggregationState,embedding,staining,vitrification,emdbMap,additionalMap,abstractTextShort,citationAuthor," +
        "doi,firstPage,journalName,lastPage,meshTerms,pmc,publicationYear,pubmedId,title,volumeId,citationAuthor,firstPage,journalName,pmc,publicationYear,pubmedId,title,volumeId," +
        "centerInitial,centerName,projectName&primaryOnly=1";
    print(url);
    // Await the http get response, then decode the json-formatted responce.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      resposta = response.body;
      resposta = resposta.replaceAll("dimStructure.", "");
      resposta = resposta.replaceAll("dimEntity.", "");
      print(resposta);
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
      if (itemsList.length == 0) {
        consulta = false;
        consultaConcluida = false;
        return new Scaffold(
          appBar: _buildBar(context),
          body: Center(
            child: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Icon(Icons.error),
                    new Text("Erro ao consultar dados...."),
                  ],
                )
              ],
            ),
          ),
        );
      } else {
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
                        childAspectRatio: 2.0,
                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: 1,
                      ),
                      delegate: new SliverChildBuilderDelegate(
                        (context, index) => new ConsultaRow(itemsList[index]),
                        childCount: itemsList.length,
                      ),
                    ),
                  ],
                ))),
                // new Text(resposta),
              ],
            ));
      }
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
