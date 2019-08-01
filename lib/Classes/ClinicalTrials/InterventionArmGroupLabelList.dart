class InterventionArmGroupLabelList{
  List<String> interventionArmGroupLabel;

  InterventionArmGroupLabelList({List<String> interventionArmGroupLabel}){
    this.interventionArmGroupLabel = interventionArmGroupLabel;
  }

  InterventionArmGroupLabelList.fromJson(Map<String, dynamic> json){
    interventionArmGroupLabel =
        json['InterventionArmGroupLabel'].cast<String>();
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['InterventionArmGroupLabel'] = this.interventionArmGroupLabel;
    return data;
  }
}