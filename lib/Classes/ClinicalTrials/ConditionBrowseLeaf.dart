class ConditionBrowseLeaf{
  String conditionBrowseLeafId;
  String conditionBrowseLeafName;
  String conditionBrowseLeafAsFound;
  String conditionBrowseLeafRelevance;

  ConditionBrowseLeaf(
     {String conditionBrowseLeafId,
      String conditionBrowseLeafName,
      String conditionBrowseLeafAsFound,
      String conditionBrowseLeafRelevance}){
    this.conditionBrowseLeafId = conditionBrowseLeafId;
    this.conditionBrowseLeafName = conditionBrowseLeafName;
    this.conditionBrowseLeafAsFound = conditionBrowseLeafAsFound;
    this.conditionBrowseLeafRelevance = conditionBrowseLeafRelevance;
  }
  ConditionBrowseLeaf.fromJson(Map<String, dynamic> json){
    conditionBrowseLeafId = json['ConditionBrowseLeafId'];
    conditionBrowseLeafName = json['ConditionBrowseLeafName'];
    conditionBrowseLeafAsFound = json['ConditionBrowseLeafAsFound'];
    conditionBrowseLeafRelevance = json['ConditionBrowseLeafRelevance'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ConditionBrowseLeafId'] = this.conditionBrowseLeafId;
    data['ConditionBrowseLeafName'] = this.conditionBrowseLeafName;
    data['ConditionBrowseLeafAsFound'] = this.conditionBrowseLeafAsFound;
    data['ConditionBrowseLeafRelevance'] = this.conditionBrowseLeafRelevance;
    return data;
  }
}