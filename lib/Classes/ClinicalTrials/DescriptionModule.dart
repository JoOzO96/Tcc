class DescriptionModule {
  String briefSummary;
  String detailedDescription;

  DescriptionModule({String briefSummary, String detailedDescription}) {
    this.briefSummary = briefSummary;
    this.detailedDescription = detailedDescription;
  }

  DescriptionModule.fromJson(Map<String, dynamic> json) {
    briefSummary = json['BriefSummary'];
    detailedDescription = json['DetailedDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BriefSummary'] = this.briefSummary;
    data['DetailedDescription'] = this.detailedDescription;
    return data;
  }
}