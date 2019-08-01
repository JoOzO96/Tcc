import 'ConditionBrowseBranch.dart';

class ConditionBrowseBranchList{
  List<ConditionBrowseBranch> conditionBrowseBranch;

  ConditionBrowseBranchList(
     {List<ConditionBrowseBranch> conditionBrowseBranch}){
    this.conditionBrowseBranch = conditionBrowseBranch;
  }

  ConditionBrowseBranchList.fromJson(Map<String, dynamic> json){
    if (json['ConditionBrowseBranch'] != null){
      conditionBrowseBranch = new List<ConditionBrowseBranch>();
      json['ConditionBrowseBranch'].forEach((v){
        conditionBrowseBranch.add(new ConditionBrowseBranch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.conditionBrowseBranch != null){
      data['ConditionBrowseBranch'] =
          this.conditionBrowseBranch.map((v) => v.toJson()).toList();
    }
    return data;
  }
}