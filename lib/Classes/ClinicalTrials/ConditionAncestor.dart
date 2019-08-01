class ConditionAncestor{
  String conditionAncestorId;
  String conditionAncestorTerm;

  ConditionAncestor(
     {String conditionAncestorId, String conditionAncestorTerm}){
    this.conditionAncestorId = conditionAncestorId;
    this.conditionAncestorTerm = conditionAncestorTerm;
  }
  ConditionAncestor.fromJson(Map<String, dynamic> json){
    conditionAncestorId = json['ConditionAncestorId'];
    conditionAncestorTerm = json['ConditionAncestorTerm'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ConditionAncestorId'] = this.conditionAncestorId;
    data['ConditionAncestorTerm'] = this.conditionAncestorTerm;
    return data;
  }
}