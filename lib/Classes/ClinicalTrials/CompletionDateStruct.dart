class CompletionDateStruct {
  String completionDate;
  String completionDateType;

  CompletionDateStruct({String completionDate, String completionDateType}) {
    this.completionDate = completionDate;
    this.completionDateType = completionDateType;
  }

  CompletionDateStruct.fromJson(Map<String, dynamic> json) {
    completionDate = json['CompletionDate'];
    completionDateType = json['CompletionDateType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CompletionDate'] = this.completionDate;
    data['CompletionDateType'] = this.completionDateType;
    return data;
  }
}