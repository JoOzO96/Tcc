class PrimaryOutcome{
  String primaryOutcomeMeasure;
  String primaryOutcomeDescription;
  String primaryOutcomeTimeFrame;

  PrimaryOutcome(
     {String primaryOutcomeMeasure,
      String primaryOutcomeDescription,
      String primaryOutcomeTimeFrame}){
    this.primaryOutcomeMeasure = primaryOutcomeMeasure;
    this.primaryOutcomeDescription = primaryOutcomeDescription;
    this.primaryOutcomeTimeFrame = primaryOutcomeTimeFrame;
  }

  PrimaryOutcome.fromJson(Map<String, dynamic> json){
    primaryOutcomeMeasure = json['PrimaryOutcomeMeasure'];
    primaryOutcomeDescription = json['PrimaryOutcomeDescription'];
    primaryOutcomeTimeFrame = json['PrimaryOutcomeTimeFrame'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PrimaryOutcomeMeasure'] = this.primaryOutcomeMeasure;
    data['PrimaryOutcomeDescription'] = this.primaryOutcomeDescription;
    data['PrimaryOutcomeTimeFrame'] = this.primaryOutcomeTimeFrame;
    return data;
  }
}
