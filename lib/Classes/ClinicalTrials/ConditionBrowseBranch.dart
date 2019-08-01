class ConditionBrowseBranch{
  String conditionBrowseBranchAbbrev;
  String conditionBrowseBranchName;

  ConditionBrowseBranch(
     {String conditionBrowseBranchAbbrev, String conditionBrowseBranchName}){
    this.conditionBrowseBranchAbbrev = conditionBrowseBranchAbbrev;
    this.conditionBrowseBranchName = conditionBrowseBranchName;
  }
  ConditionBrowseBranch.fromJson(Map<String, dynamic> json){
    conditionBrowseBranchAbbrev = json['ConditionBrowseBranchAbbrev'];
    conditionBrowseBranchName = json['ConditionBrowseBranchName'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ConditionBrowseBranchAbbrev'] = this.conditionBrowseBranchAbbrev;
    data['ConditionBrowseBranchName'] = this.conditionBrowseBranchName;
    return data;
  }
}