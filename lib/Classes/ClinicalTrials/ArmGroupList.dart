import 'ArmGroup.dart';

class ArmGroupList{
  List<ArmGroup> armGroup;

  ArmGroupList({List<ArmGroup> armGroup}){
    this.armGroup = armGroup;
  }

  ArmGroupList.fromJson(Map<String, dynamic> json){
    if (json['ArmGroup'] != null){
      armGroup = new List<ArmGroup>();
      json['ArmGroup'].forEach((v){
        armGroup.add(new ArmGroup.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.armGroup != null){
      data['ArmGroup'] = this.armGroup.map((v) => v.toJson()).toList();
    }
    return data;
  }
}