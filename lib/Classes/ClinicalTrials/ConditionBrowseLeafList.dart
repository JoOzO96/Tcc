import 'ConditionBrowseLeaf.dart';

class ConditionBrowseLeafList{
  List<ConditionBrowseLeaf> conditionBrowseLeaf;

  ConditionBrowseLeafList({List<ConditionBrowseLeaf> conditionBrowseLeaf}){
    this.conditionBrowseLeaf = conditionBrowseLeaf;
  }

  ConditionBrowseLeafList.fromJson(Map<String, dynamic> json){
    if (json['ConditionBrowseLeaf'] != null){
      conditionBrowseLeaf = new List<ConditionBrowseLeaf>();
      json['ConditionBrowseLeaf'].forEach((v){
        conditionBrowseLeaf.add(new ConditionBrowseLeaf.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.conditionBrowseLeaf != null){
      data['ConditionBrowseLeaf'] =
          this.conditionBrowseLeaf.map((v) => v.toJson()).toList();
    }
    return data;
  }
}