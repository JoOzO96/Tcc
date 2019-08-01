import 'Intervention.dart';

class InterventionList{
  List<Intervention> intervention;

  InterventionList({List<Intervention> intervention}){
    this.intervention = intervention;
  }

  InterventionList.fromJson(Map<String, dynamic> json){
    if (json['Intervention'] != null){
      intervention = new List<Intervention>();
      json['Intervention'].forEach((v){
        intervention.add(new Intervention.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.intervention != null){
      data['Intervention'] = this.intervention.map((v) => v.toJson()).toList();
    }
    return data;
  }
}