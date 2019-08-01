import 'OverallOfficial.dart';

class OverallOfficialList{
  List<OverallOfficial> overallOfficial;

  OverallOfficialList({List<OverallOfficial> overallOfficial}){
    this.overallOfficial = overallOfficial;
  }
  OverallOfficialList.fromJson(Map<String, dynamic> json){
    if (json['OverallOfficial'] != null){
      overallOfficial = new List<OverallOfficial>();
      json['OverallOfficial'].forEach((v){
        overallOfficial.add(new OverallOfficial.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.overallOfficial != null){
      data['OverallOfficial'] =
          this.overallOfficial.map((v) => v.toJson()).toList();
    }
    return data;
  }
}