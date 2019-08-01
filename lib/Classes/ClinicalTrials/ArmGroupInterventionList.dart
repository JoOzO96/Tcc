class ArmGroupInterventionList{
  List<String> armGroupInterventionName;

  ArmGroupInterventionList({List<String> armGroupInterventionName}){
    this.armGroupInterventionName = armGroupInterventionName;
  }

  ArmGroupInterventionList.fromJson(Map<String, dynamic> json){
    armGroupInterventionName = json['ArmGroupInterventionName'].cast<String>();
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ArmGroupInterventionName'] = this.armGroupInterventionName;
    return data;
  }
}