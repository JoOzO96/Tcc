import 'FullStudies.dart';

class FullStudiesResponse {
  String aPIVrs;
  String dataVrs;
  String expression;
  int nStudiesAvail;
  int nStudiesFound;
  int minRank;
  int maxRank;
  int nStudiesReturned;
  List<FullStudies> fullStudies;

  FullStudiesResponse(
      {String aPIVrs,
      String dataVrs,
      String expression,
      int nStudiesAvail,
      int nStudiesFound,
      int minRank,
      int maxRank,
      int nStudiesReturned,
      List<FullStudies> fullStudies}) {
    this.aPIVrs = aPIVrs;
    this.dataVrs = dataVrs;
    this.expression = expression;
    this.nStudiesAvail = nStudiesAvail;
    this.nStudiesFound = nStudiesFound;
    this.minRank = minRank;
    this.maxRank = maxRank;
    this.nStudiesReturned = nStudiesReturned;
    this.fullStudies = fullStudies;
  }
  
  FullStudiesResponse.fromJson(Map<String, dynamic> json) {
    aPIVrs = json['APIVrs'];
    dataVrs = json['DataVrs'];
    expression = json['Expression'];
    nStudiesAvail = json['NStudiesAvail'];
    nStudiesFound = json['NStudiesFound'];
    minRank = json['MinRank'];
    maxRank = json['MaxRank'];
    nStudiesReturned = json['NStudiesReturned'];
    if (json['FullStudies'] != null) {
      fullStudies = new List<FullStudies>();
      json['FullStudies'].forEach((v) {
        fullStudies.add(new FullStudies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['APIVrs'] = this.aPIVrs;
    data['DataVrs'] = this.dataVrs;
    data['Expression'] = this.expression;
    data['NStudiesAvail'] = this.nStudiesAvail;
    data['NStudiesFound'] = this.nStudiesFound;
    data['MinRank'] = this.minRank;
    data['MaxRank'] = this.maxRank;
    data['NStudiesReturned'] = this.nStudiesReturned;
    if (this.fullStudies != null) {
      data['FullStudies'] = this.fullStudies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}