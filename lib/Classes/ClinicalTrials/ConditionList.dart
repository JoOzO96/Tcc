class ConditionList {
  List<String> condition;

  ConditionList({List<String> condition}) {
    this.condition = condition;
  }

  ConditionList.fromJson(Map<String, dynamic> json) {
    condition = json['Condition'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Condition'] = this.condition;
    return data;
  }
}