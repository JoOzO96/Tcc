import 'package:unidb/Classes/ClinicalTrials/PrimaryOutcome.dart';

class PrimaryOutcomeList{
  List<PrimaryOutcome> primaryOutcome;

  PrimaryOutcomeList({List<PrimaryOutcome> primaryOutcome}){
    this.primaryOutcome = primaryOutcome;
  }
  
  PrimaryOutcomeList.fromJson(Map<String, dynamic> json){
    if (json['PrimaryOutcome'] != null){
      primaryOutcome = new List<PrimaryOutcome>();
      json['PrimaryOutcome'].forEach((v){
        primaryOutcome.add(new PrimaryOutcome.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.primaryOutcome != null){
      data['PrimaryOutcome'] =
          this.primaryOutcome.map((v) => v.toJson()).toList();
    }
    return data;
  }
}