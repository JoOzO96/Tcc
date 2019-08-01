import 'StdAgeList.dart';

class EligibilityModule{
  String eligibilityCriteria;
  String healthyVolunteers;
  String gender;
  String minimumAge;
  String maximumAge;
  StdAgeList stdAgeList;

  EligibilityModule(
     {String eligibilityCriteria,
      String healthyVolunteers,
      String gender,
      String minimumAge,
      String maximumAge,
      StdAgeList stdAgeList}){
    this.eligibilityCriteria = eligibilityCriteria;
    this.healthyVolunteers = healthyVolunteers;
    this.gender = gender;
    this.minimumAge = minimumAge;
    this.maximumAge = maximumAge;
    this.stdAgeList = stdAgeList;
  }

  EligibilityModule.fromJson(Map<String, dynamic> json){
    eligibilityCriteria = json['EligibilityCriteria'];
    healthyVolunteers = json['HealthyVolunteers'];
    gender = json['Gender'];
    minimumAge = json['MinimumAge'];
    maximumAge = json['MaximumAge'];
    stdAgeList = json['StdAgeList'] != null
        ? new StdAgeList.fromJson(json['StdAgeList'])
        : null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EligibilityCriteria'] = this.eligibilityCriteria;
    data['HealthyVolunteers'] = this.healthyVolunteers;
    data['Gender'] = this.gender;
    data['MinimumAge'] = this.minimumAge;
    data['MaximumAge'] = this.maximumAge;
    if (this.stdAgeList != null){
      data['StdAgeList'] = this.stdAgeList.toJson();
    }
    return data;
  }
}