class OrgStudyIdInfo {
  String orgStudyId;

  OrgStudyIdInfo({String orgStudyId}) {
    this.orgStudyId = orgStudyId;
  }
  OrgStudyIdInfo.fromJson(Map<String, dynamic> json) {
    orgStudyId = json['OrgStudyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrgStudyId'] = this.orgStudyId;
    return data;
  }
}