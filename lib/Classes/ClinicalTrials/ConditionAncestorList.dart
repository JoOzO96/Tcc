import 'ConditionAncestor.dart';

class ConditionAncestorList{
  List<ConditionAncestor> conditionAncestor;

  ConditionAncestorList({List<ConditionAncestor> conditionAncestor}){
    this.conditionAncestor = conditionAncestor;
  }

  ConditionAncestorList.fromJson(Map<String, dynamic> json){
    if (json['ConditionAncestor'] != null){
      conditionAncestor = new List<ConditionAncestor>();
      json['ConditionAncestor'].forEach((v){
        conditionAncestor.add(new ConditionAncestor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.conditionAncestor != null){
      data['ConditionAncestor'] =
          this.conditionAncestor.map((v) => v.toJson()).toList();
    }
    return data;
  }
}