import 'CompletionDateStruct.dart';
import 'ExpandedAccessInfo.dart';
import 'LastUpdatePostDateStruct.dart';
import 'PrimaryCompletionDateStruct.dart';
import 'StartDateStruct.dart';
import 'StudyFirstPostDateStruct.dart';

class StatusModule {
  String statusVerifiedDate;
  String overallStatus;
  String lastKnownStatus;
  ExpandedAccessInfo expandedAccessInfo;
  StartDateStruct startDateStruct;
  PrimaryCompletionDateStruct primaryCompletionDateStruct;
  CompletionDateStruct completionDateStruct;
  String studyFirstSubmitDate;
  String studyFirstSubmitQCDate;
  StudyFirstPostDateStruct studyFirstPostDateStruct;
  String lastUpdateSubmitDate;
  LastUpdatePostDateStruct lastUpdatePostDateStruct;

  StatusModule(
      {String statusVerifiedDate,
      String overallStatus,
      String lastKnownStatus,
      ExpandedAccessInfo expandedAccessInfo,
      StartDateStruct startDateStruct,
      PrimaryCompletionDateStruct primaryCompletionDateStruct,
      CompletionDateStruct completionDateStruct,
      String studyFirstSubmitDate,
      String studyFirstSubmitQCDate,
      StudyFirstPostDateStruct studyFirstPostDateStruct,
      String lastUpdateSubmitDate,
      LastUpdatePostDateStruct lastUpdatePostDateStruct}) {
    this.statusVerifiedDate = statusVerifiedDate;
    this.overallStatus = overallStatus;
    this.lastKnownStatus = lastKnownStatus;
    this.expandedAccessInfo = expandedAccessInfo;
    this.startDateStruct = startDateStruct;
    this.primaryCompletionDateStruct = primaryCompletionDateStruct;
    this.completionDateStruct = completionDateStruct;
    this.studyFirstSubmitDate = studyFirstSubmitDate;
    this.studyFirstSubmitQCDate = studyFirstSubmitQCDate;
    this.studyFirstPostDateStruct = studyFirstPostDateStruct;
    this.lastUpdateSubmitDate = lastUpdateSubmitDate;
    this.lastUpdatePostDateStruct = lastUpdatePostDateStruct;
  }

  StatusModule.fromJson(Map<String, dynamic> json) {
    statusVerifiedDate = json['StatusVerifiedDate'];
    overallStatus = json['OverallStatus'];
    lastKnownStatus = json['LastKnownStatus'];
    expandedAccessInfo = json['ExpandedAccessInfo'] != null
        ? new ExpandedAccessInfo.fromJson(json['ExpandedAccessInfo'])
        : null;
    startDateStruct = json['StartDateStruct'] != null
        ? new StartDateStruct.fromJson(json['StartDateStruct'])
        : null;
    primaryCompletionDateStruct = json['PrimaryCompletionDateStruct'] != null
        ? new PrimaryCompletionDateStruct.fromJson(
            json['PrimaryCompletionDateStruct'])
        : null;
    completionDateStruct = json['CompletionDateStruct'] != null
        ? new CompletionDateStruct.fromJson(json['CompletionDateStruct'])
        : null;
    studyFirstSubmitDate = json['StudyFirstSubmitDate'];
    studyFirstSubmitQCDate = json['StudyFirstSubmitQCDate'];
    studyFirstPostDateStruct = json['StudyFirstPostDateStruct'] != null
        ? new StudyFirstPostDateStruct.fromJson(
            json['StudyFirstPostDateStruct'])
        : null;
    lastUpdateSubmitDate = json['LastUpdateSubmitDate'];
    lastUpdatePostDateStruct = json['LastUpdatePostDateStruct'] != null
        ? new LastUpdatePostDateStruct.fromJson(
            json['LastUpdatePostDateStruct'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StatusVerifiedDate'] = this.statusVerifiedDate;
    data['OverallStatus'] = this.overallStatus;
    data['LastKnownStatus'] = this.lastKnownStatus;
    if (this.expandedAccessInfo != null) {
      data['ExpandedAccessInfo'] = this.expandedAccessInfo.toJson();
    }
    if (this.startDateStruct != null) {
      data['StartDateStruct'] = this.startDateStruct.toJson();
    }
    if (this.primaryCompletionDateStruct != null) {
      data['PrimaryCompletionDateStruct'] =
          this.primaryCompletionDateStruct.toJson();
    }
    if (this.completionDateStruct != null) {
      data['CompletionDateStruct'] = this.completionDateStruct.toJson();
    }
    data['StudyFirstSubmitDate'] = this.studyFirstSubmitDate;
    data['StudyFirstSubmitQCDate'] = this.studyFirstSubmitQCDate;
    if (this.studyFirstPostDateStruct != null) {
      data['StudyFirstPostDateStruct'] =
          this.studyFirstPostDateStruct.toJson();
    }
    data['LastUpdateSubmitDate'] = this.lastUpdateSubmitDate;
    if (this.lastUpdatePostDateStruct != null) {
      data['LastUpdatePostDateStruct'] =
          this.lastUpdatePostDateStruct.toJson();
    }
    return data;
  }
}