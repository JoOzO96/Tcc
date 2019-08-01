import 'package:unidb/Classes/ClinicalTrials/ConditionMesh.dart';

class ConditionMeshList{
  List<ConditionMesh> conditionMesh;

  ConditionMeshList({List<ConditionMesh> conditionMesh}){
    this.conditionMesh = conditionMesh;
  }

  ConditionMeshList.fromJson(Map<String, dynamic> json){
    if (json['ConditionMesh'] != null){
      conditionMesh = new List<ConditionMesh>();
      json['ConditionMesh'].forEach((v){
        conditionMesh.add(new ConditionMesh.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.conditionMesh != null){
      data['ConditionMesh'] =
          this.conditionMesh.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

