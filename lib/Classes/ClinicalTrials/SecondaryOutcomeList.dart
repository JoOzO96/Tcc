import 'SecondaryOutcome.dart';

class SecondaryOutcomeList{
  List<SecondaryOutcome> secondaryOutcome;

  SecondaryOutcomeList({List<SecondaryOutcome> secondaryOutcome}){
    this.secondaryOutcome = secondaryOutcome;
  }
  
  SecondaryOutcomeList.fromJson(Map<String, dynamic> json){
    if (json['SecondaryOutcome'] != null){
      secondaryOutcome = new List<SecondaryOutcome>();
      json['SecondaryOutcome'].forEach((v){
        secondaryOutcome.add(new SecondaryOutcome.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.secondaryOutcome != null){
      data['SecondaryOutcome'] =
          this.secondaryOutcome.map((v) => v.toJson()).toList();
    }
    return data;
  }
}