
import 'package:unidb/Classes/FullStudyResponse.dart';

class ClinicalTrials {
  
  FullStudiesResponse fullStudiesResponse;
  
  ClinicalTrials.fromJson(Map<String, dynamic> json)
  : fullStudiesResponse = FullStudiesResponse.fromJson(json);

  ClinicalTrials();
}
