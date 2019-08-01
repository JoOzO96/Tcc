class EnrollmentInfo {
  String enrollmentCount;
  String enrollmentType;

  EnrollmentInfo({String enrollmentCount, String enrollmentType}) {
    this.enrollmentCount = enrollmentCount;
    this.enrollmentType = enrollmentType;
  }


  EnrollmentInfo.fromJson(Map<String, dynamic> json) {
    enrollmentCount = json['EnrollmentCount'];
    enrollmentType = json['EnrollmentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EnrollmentCount'] = this.enrollmentCount;
    data['EnrollmentType'] = this.enrollmentType;
    return data;
  }
}