import 'ArmGroupInterventionList.dart';

class ArmGroup{
  String armGroupLabel;
  String armGroupType;
  String armGroupDescription;
  ArmGroupInterventionList armGroupInterventionList;

  ArmGroup(
     {String armGroupLabel,
      String armGroupType,
      String armGroupDescription,
      ArmGroupInterventionList armGroupInterventionList}){
    this.armGroupLabel = armGroupLabel;
    this.armGroupType = armGroupType;
    this.armGroupDescription = armGroupDescription;
    this.armGroupInterventionList = armGroupInterventionList;
  }

  ArmGroup.fromJson(Map<String, dynamic> json){
    armGroupLabel = json['ArmGroupLabel'];
    armGroupType = json['ArmGroupType'];
    armGroupDescription = json['ArmGroupDescription'];
    armGroupInterventionList = json['ArmGroupInterventionList'] != null
        ? new ArmGroupInterventionList.fromJson(
            json['ArmGroupInterventionList'])
        : null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ArmGroupLabel'] = this.armGroupLabel;
    data['ArmGroupType'] = this.armGroupType;
    data['ArmGroupDescription'] = this.armGroupDescription;
    if (this.armGroupInterventionList != null){
      data['ArmGroupInterventionList'] =
          this.armGroupInterventionList.toJson();
    }
    return data;
  }
}