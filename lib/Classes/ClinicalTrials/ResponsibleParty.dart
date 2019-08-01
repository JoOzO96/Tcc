class ResponsibleParty {
  String responsiblePartyType;

  ResponsibleParty({String responsiblePartyType}) {
    this.responsiblePartyType = responsiblePartyType;
  }
  ResponsibleParty.fromJson(Map<String, dynamic> json) {
    responsiblePartyType = json['ResponsiblePartyType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponsiblePartyType'] = this.responsiblePartyType;
    return data;
  }
}