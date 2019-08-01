class ExpandedAccessInfo {
  String hasExpandedAccess;

  ExpandedAccessInfo({String hasExpandedAccess}) {
    this.hasExpandedAccess = hasExpandedAccess;
  }

  ExpandedAccessInfo.fromJson(Map<String, dynamic> json) {
    hasExpandedAccess = json['HasExpandedAccess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HasExpandedAccess'] = this.hasExpandedAccess;
    return data;
  }
}