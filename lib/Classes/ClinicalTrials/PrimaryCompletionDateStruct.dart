class PrimaryCompletionDateStruct {
  String primaryCompletionDate;
  String primaryCompletionDateType;

  PrimaryCompletionDateStruct(
      {String primaryCompletionDate, String primaryCompletionDateType}) {
    this.primaryCompletionDate = primaryCompletionDate;
    this.primaryCompletionDateType = primaryCompletionDateType;
  }

  PrimaryCompletionDateStruct.fromJson(Map<String, dynamic> json) {
    primaryCompletionDate = json['PrimaryCompletionDate'];
    primaryCompletionDateType = json['PrimaryCompletionDateType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PrimaryCompletionDate'] = this.primaryCompletionDate;
    data['PrimaryCompletionDateType'] = this.primaryCompletionDateType;
    return data;
  }
}