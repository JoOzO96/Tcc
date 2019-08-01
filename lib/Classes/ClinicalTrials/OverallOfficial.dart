class OverallOfficial{
  String overallOfficialName;
  String overallOfficialAffiliation;
  String overallOfficialRole;

  OverallOfficial(
     {String overallOfficialName,
      String overallOfficialAffiliation,
      String overallOfficialRole}){
    this.overallOfficialName = overallOfficialName;
    this.overallOfficialAffiliation = overallOfficialAffiliation;
    this.overallOfficialRole = overallOfficialRole;
  }


  OverallOfficial.fromJson(Map<String, dynamic> json){
    overallOfficialName = json['OverallOfficialName'];
    overallOfficialAffiliation = json['OverallOfficialAffiliation'];
    overallOfficialRole = json['OverallOfficialRole'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OverallOfficialName'] = this.overallOfficialName;
    data['OverallOfficialAffiliation'] = this.overallOfficialAffiliation;
    data['OverallOfficialRole'] = this.overallOfficialRole;
    return data;
  }
}
