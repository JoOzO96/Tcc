class LastUpdatePostDateStruct {
  String lastUpdatePostDate;
  String lastUpdatePostDateType;

  LastUpdatePostDateStruct(
      {String lastUpdatePostDate, String lastUpdatePostDateType}) {
    this.lastUpdatePostDate = lastUpdatePostDate;
    this.lastUpdatePostDateType = lastUpdatePostDateType;
  }

  LastUpdatePostDateStruct.fromJson(Map<String, dynamic> json) {
    lastUpdatePostDate = json['LastUpdatePostDate'];
    lastUpdatePostDateType = json['LastUpdatePostDateType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LastUpdatePostDate'] = this.lastUpdatePostDate;
    data['LastUpdatePostDateType'] = this.lastUpdatePostDateType;
    return data;
  }
}