import 'ArmGroupList.dart';
import 'InterventionList.dart';

class ArmsInterventionsModule{
  ArmGroupList armGroupList;
  InterventionList interventionList;

  ArmsInterventionsModule(
     {ArmGroupList armGroupList, InterventionList interventionList}){
    this.armGroupList = armGroupList;
    this.interventionList = interventionList;
  }
  
  ArmsInterventionsModule.fromJson(Map<String, dynamic> json){
    armGroupList = json['ArmGroupList'] != null
        ? new ArmGroupList.fromJson(json['ArmGroupList'])
        : null;
    interventionList = json['InterventionList'] != null
        ? new InterventionList.fromJson(json['InterventionList'])
        : null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.armGroupList != null){
      data['ArmGroupList'] = this.armGroupList.toJson();
    }
    if (this.interventionList != null){
      data['InterventionList'] = this.interventionList.toJson();
    }
    return data;
  }
}