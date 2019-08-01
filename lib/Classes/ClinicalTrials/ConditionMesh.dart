class ConditionMesh{
  String conditionMeshId;
  String conditionMeshTerm;

  ConditionMesh({String conditionMeshId, String conditionMeshTerm}){
    this.conditionMeshId = conditionMeshId;
    this.conditionMeshTerm = conditionMeshTerm;
  }

  ConditionMesh.fromJson(Map<String, dynamic> json){
    conditionMeshId = json['ConditionMeshId'];
    conditionMeshTerm = json['ConditionMeshTerm'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ConditionMeshId'] = this.conditionMeshId;
    data['ConditionMeshTerm'] = this.conditionMeshTerm;
    return data;
  }
}