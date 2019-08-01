import 'ConditionBrowseModule.dart';
import 'MiscInfoModule.dart';

class DerivedSection{
  MiscInfoModule miscInfoModule;
  ConditionBrowseModule conditionBrowseModule;

  DerivedSection(
     {MiscInfoModule miscInfoModule,
      ConditionBrowseModule conditionBrowseModule}){
    this.miscInfoModule = miscInfoModule;
    this.conditionBrowseModule = conditionBrowseModule;
  }

  DerivedSection.fromJson(Map<String, dynamic> json){
    miscInfoModule = json['MiscInfoModule'] != null
        ? new MiscInfoModule.fromJson(json['MiscInfoModule'])
        : null;
    conditionBrowseModule = json['ConditionBrowseModule'] != null
        ? new ConditionBrowseModule.fromJson(json['ConditionBrowseModule'])
        : null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.miscInfoModule != null){
      data['MiscInfoModule'] = this.miscInfoModule.toJson();
    }
    if (this.conditionBrowseModule != null){
      data['ConditionBrowseModule'] = this.conditionBrowseModule.toJson();
    }
    return data;
  }
}