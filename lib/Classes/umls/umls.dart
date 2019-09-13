class Umls {
  int pageSize;
  int pageNumber;
  Result result;

  Umls({this.pageSize, this.pageNumber, this.result});

  Umls.fromJson(Map<String, dynamic> json) {
    pageSize = json['pageSize'];
    pageNumber = json['pageNumber'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageSize'] = this.pageSize;
    data['pageNumber'] = this.pageNumber;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  String classType;
  List<Results> results;

  Result({this.classType, this.results});

  Result.fromJson(Map<String, dynamic> json) {
    classType = json['classType'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classType'] = this.classType;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String ui;
  String rootSource;
  String uri;
  String name;

  Results({this.ui, this.rootSource, this.uri, this.name});

  Results.fromJson(Map<String, dynamic> json) {
    ui = json['ui'];
    rootSource = json['rootSource'];
    uri = json['uri'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ui'] = this.ui;
    data['rootSource'] = this.rootSource;
    data['uri'] = this.uri;
    data['name'] = this.name;
    return data;
  }
}