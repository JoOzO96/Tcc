class Organization {
  String orgFullName;
  String orgClass;

  Organization({String orgFullName, String orgClass}) {
    this.orgFullName = orgFullName;
    this.orgClass = orgClass;
  }

  Organization.fromJson(Map<String, dynamic> json) {
    orgFullName = json['OrgFullName'];
    orgClass = json['OrgClass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrgFullName'] = this.orgFullName;
    data['OrgClass'] = this.orgClass;
    return data;
  }
}
