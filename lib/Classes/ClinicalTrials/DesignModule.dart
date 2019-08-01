import 'DesignInfo.dart';
import 'EnrollmentInfo.dart';
import 'PhaseList.dart';

class DesignModule {
  String studyType;
  PhaseList phaseList;
  DesignInfo designInfo;
  EnrollmentInfo enrollmentInfo;

  DesignModule(
      {String studyType,
      PhaseList phaseList,
      DesignInfo designInfo,
      EnrollmentInfo enrollmentInfo}) {
    this.studyType = studyType;
    this.phaseList = phaseList;
    this.designInfo = designInfo;
    this.enrollmentInfo = enrollmentInfo;
  }

  DesignModule.fromJson(Map<String, dynamic> json) {
    studyType = json['StudyType'];
    phaseList = json['PhaseList'] != null
        ? new PhaseList.fromJson(json['PhaseList'])
        : null;
    designInfo = json['DesignInfo'] != null
        ? new DesignInfo.fromJson(json['DesignInfo'])
        : null;
    enrollmentInfo = json['EnrollmentInfo'] != null
        ? new EnrollmentInfo.fromJson(json['EnrollmentInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StudyType'] = this.studyType;
    if (this.phaseList != null) {
      data['PhaseList'] = this.phaseList.toJson();
    }
    if (this.designInfo != null) {
      data['DesignInfo'] = this.designInfo.toJson();
    }
    if (this.enrollmentInfo != null) {
      data['EnrollmentInfo'] = this.enrollmentInfo.toJson();
    }
    return data;
  }
}