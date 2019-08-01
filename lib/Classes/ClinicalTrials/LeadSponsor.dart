class LeadSponsor {
  String leadSponsorName;
  String leadSponsorClass;

  LeadSponsor({String leadSponsorName, String leadSponsorClass}) {
    this.leadSponsorName = leadSponsorName;
    this.leadSponsorClass = leadSponsorClass;
  }

  LeadSponsor.fromJson(Map<String, dynamic> json) {
    leadSponsorName = json['LeadSponsorName'];
    leadSponsorClass = json['LeadSponsorClass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LeadSponsorName'] = this.leadSponsorName;
    data['LeadSponsorClass'] = this.leadSponsorClass;
    return data;
  }
}