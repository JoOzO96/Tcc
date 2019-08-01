import 'ConditionAncestorList.dart';
import 'ConditionBrowseBranchList.dart';
import 'ConditionBrowseLeafList.dart';
import 'ConditionMeshList.dart';

class ConditionBrowseModule{
  ConditionMeshList conditionMeshList;
  ConditionAncestorList conditionAncestorList;
  ConditionBrowseLeafList conditionBrowseLeafList;
  ConditionBrowseBranchList conditionBrowseBranchList;

  ConditionBrowseModule(
     {ConditionMeshList conditionMeshList,
      ConditionAncestorList conditionAncestorList,
      ConditionBrowseLeafList conditionBrowseLeafList,
      ConditionBrowseBranchList conditionBrowseBranchList}){
    this.conditionMeshList = conditionMeshList;
    this.conditionAncestorList = conditionAncestorList;
    this.conditionBrowseLeafList = conditionBrowseLeafList;
    this.conditionBrowseBranchList = conditionBrowseBranchList;
  }
  
  ConditionBrowseModule.fromJson(Map<String, dynamic> json){
    conditionMeshList = json['ConditionMeshList'] != null
        ? new ConditionMeshList.fromJson(json['ConditionMeshList'])
        : null;
    conditionAncestorList = json['ConditionAncestorList'] != null
        ? new ConditionAncestorList.fromJson(json['ConditionAncestorList'])
        : null;
    conditionBrowseLeafList = json['ConditionBrowseLeafList'] != null
        ? new ConditionBrowseLeafList.fromJson(json['ConditionBrowseLeafList'])
        : null;
    conditionBrowseBranchList = json['ConditionBrowseBranchList'] != null
        ? new ConditionBrowseBranchList.fromJson(
            json['ConditionBrowseBranchList'])
        : null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.conditionMeshList != null){
      data['ConditionMeshList'] = this.conditionMeshList.toJson();
    }
    if (this.conditionAncestorList != null){
      data['ConditionAncestorList'] = this.conditionAncestorList.toJson();
    }
    if (this.conditionBrowseLeafList != null){
      data['ConditionBrowseLeafList'] = this.conditionBrowseLeafList.toJson();
    }
    if (this.conditionBrowseBranchList != null){
      data['ConditionBrowseBranchList'] =
          this.conditionBrowseBranchList.toJson();
    }
    return data;
  }
}