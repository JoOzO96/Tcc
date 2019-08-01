import 'package:unidb/Classes/ClinicalTrials/KeywordList.dart';

import 'ConditionList.dart';

class ConditionsModule {
  ConditionList conditionList;
  KeywordList keywordList;

  ConditionsModule({ConditionList conditionList, KeywordList keywordList}) {
    this.conditionList = conditionList;
    this.keywordList = keywordList;
  }

  ConditionsModule.fromJson(Map<String, dynamic> json) {
    conditionList = json['ConditionList'] != null
        ? new ConditionList.fromJson(json['ConditionList'])
        : null;
    keywordList = json['KeywordList'] != null
        ? new KeywordList.fromJson(json['KeywordList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.conditionList != null) {
      data['ConditionList'] = this.conditionList.toJson();
    }
    if (this.keywordList != null) {
      data['KeywordList'] = this.keywordList.toJson();
    }
    return data;
  }
}