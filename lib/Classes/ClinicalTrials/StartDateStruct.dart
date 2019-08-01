class StartDateStruct {
  String startDate;

  StartDateStruct({String startDate}) {
    this.startDate = startDate;
  }


  StartDateStruct.fromJson(Map<String, dynamic> json) {
    startDate = json['StartDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StartDate'] = this.startDate;
    return data;
  }
}