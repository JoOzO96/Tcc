class StudyFirstPostDateStruct {
  String studyFirstPostDate;
  String studyFirstPostDateType;

  StudyFirstPostDateStruct(
      {String studyFirstPostDate, String studyFirstPostDateType}) {
    this.studyFirstPostDate = studyFirstPostDate;
    this.studyFirstPostDateType = studyFirstPostDateType;
  }

  StudyFirstPostDateStruct.fromJson(Map<String, dynamic> json) {
    studyFirstPostDate = json['StudyFirstPostDate'];
    studyFirstPostDateType = json['StudyFirstPostDateType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StudyFirstPostDate'] = this.studyFirstPostDate;
    data['StudyFirstPostDateType'] = this.studyFirstPostDateType;
    return data;
  }
}