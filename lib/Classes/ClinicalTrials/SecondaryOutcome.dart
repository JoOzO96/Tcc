class SecondaryOutcome{
  String secondaryOutcomeMeasure;
  String secondaryOutcomeDescription;
  String secondaryOutcomeTimeFrame;

  SecondaryOutcome(
     {String secondaryOutcomeMeasure,
      String secondaryOutcomeDescription,
      String secondaryOutcomeTimeFrame}){
    this.secondaryOutcomeMeasure = secondaryOutcomeMeasure;
    this.secondaryOutcomeDescription = secondaryOutcomeDescription;
    this.secondaryOutcomeTimeFrame = secondaryOutcomeTimeFrame;
  }

  SecondaryOutcome.fromJson(Map<String, dynamic> json){
    secondaryOutcomeMeasure = json['SecondaryOutcomeMeasure'];
    secondaryOutcomeDescription = json['SecondaryOutcomeDescription'];
    secondaryOutcomeTimeFrame = json['SecondaryOutcomeTimeFrame'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SecondaryOutcomeMeasure'] = this.secondaryOutcomeMeasure;
    data['SecondaryOutcomeDescription'] = this.secondaryOutcomeDescription;
    data['SecondaryOutcomeTimeFrame'] = this.secondaryOutcomeTimeFrame;
    return data;
  }
}