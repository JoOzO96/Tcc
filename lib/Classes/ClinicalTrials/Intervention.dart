import 'InterventionArmGroupLabelList.dart';

class Intervention{
  String interventionType;
  String interventionName;
  String interventionDescription;
  InterventionArmGroupLabelList interventionArmGroupLabelList;

  Intervention(
     {String interventionType,
      String interventionName,
      String interventionDescription,
      InterventionArmGroupLabelList interventionArmGroupLabelList}){
    this.interventionType = interventionType;
    this.interventionName = interventionName;
    this.interventionDescription = interventionDescription;
    this.interventionArmGroupLabelList = interventionArmGroupLabelList;
  }
  Intervention.fromJson(Map<String, dynamic> json){
    interventionType = json['InterventionType'];
    interventionName = json['InterventionName'];
    interventionDescription = json['InterventionDescription'];
    interventionArmGroupLabelList =
        json['InterventionArmGroupLabelList'] != null
            ? new InterventionArmGroupLabelList.fromJson(
                json['InterventionArmGroupLabelList'])
            : null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['InterventionType'] = this.interventionType;
    data['InterventionName'] = this.interventionName;
    data['InterventionDescription'] = this.interventionDescription;
    if (this.interventionArmGroupLabelList != null){
      data['InterventionArmGroupLabelList'] =
          this.interventionArmGroupLabelList.toJson();
    }
    return data;
  }
}