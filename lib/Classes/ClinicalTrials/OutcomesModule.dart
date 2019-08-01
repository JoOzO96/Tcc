import 'PrimaryOutcomeList.dart';
import 'SecondaryOutcomeList.dart';

class OutcomesModule{
  PrimaryOutcomeList primaryOutcomeList;
  SecondaryOutcomeList secondaryOutcomeList;

  OutcomesModule(
     {PrimaryOutcomeList primaryOutcomeList,
      SecondaryOutcomeList secondaryOutcomeList}){
    this.primaryOutcomeList = primaryOutcomeList;
    this.secondaryOutcomeList = secondaryOutcomeList;
  }

  OutcomesModule.fromJson(Map<String, dynamic> json){
    primaryOutcomeList = json['PrimaryOutcomeList'] != null
        ? new PrimaryOutcomeList.fromJson(json['PrimaryOutcomeList'])
        : null;
    secondaryOutcomeList = json['SecondaryOutcomeList'] != null
        ? new SecondaryOutcomeList.fromJson(json['SecondaryOutcomeList'])
        : null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.primaryOutcomeList != null){
      data['PrimaryOutcomeList'] = this.primaryOutcomeList.toJson();
    }
    if (this.secondaryOutcomeList != null){
      data['SecondaryOutcomeList'] = this.secondaryOutcomeList.toJson();
    }
    return data;
  }
}