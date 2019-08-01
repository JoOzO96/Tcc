import 'OrgStudyIdInfo.dart';
import 'Organization.dart';

class IdentificationModule {
  String nCTId;
  OrgStudyIdInfo orgStudyIdInfo;
  Organization organization;
  String briefTitle;
  String officialTitle;
  String acronym;

  IdentificationModule(
      {String nCTId,
      OrgStudyIdInfo orgStudyIdInfo,
      Organization organization,
      String briefTitle,
      String officialTitle,
      String acronym}) {
    this.nCTId = nCTId;
    this.orgStudyIdInfo = orgStudyIdInfo;
    this.organization = organization;
    this.briefTitle = briefTitle;
    this.officialTitle = officialTitle;
    this.acronym = acronym;
  }

  IdentificationModule.fromJson(Map<String, dynamic> json) {
    nCTId = json['NCTId'];
    orgStudyIdInfo = json['OrgStudyIdInfo'] != null
        ? new OrgStudyIdInfo.fromJson(json['OrgStudyIdInfo'])
        : null;
    organization = json['Organization'] != null
        ? new Organization.fromJson(json['Organization'])
        : null;
    briefTitle = json['BriefTitle'];
    officialTitle = json['OfficialTitle'];
    acronym = json['Acronym'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NCTId'] = this.nCTId;
    if (this.orgStudyIdInfo != null) {
      data['OrgStudyIdInfo'] = this.orgStudyIdInfo.toJson();
    }
    if (this.organization != null) {
      data['Organization'] = this.organization.toJson();
    }
    data['BriefTitle'] = this.briefTitle;
    data['OfficialTitle'] = this.officialTitle;
    data['Acronym'] = this.acronym;
    return data;
  }
}