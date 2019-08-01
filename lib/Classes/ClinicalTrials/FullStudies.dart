import 'Study.dart';

class FullStudies {
  int rank;
  Study study;

  FullStudies({int rank, Study study}) {
    this.rank = rank;
    this.study = study;
  }
  FullStudies.fromJson(Map<String, dynamic> json) {
    rank = json['Rank'];
    study = json['Study'] != null ? new Study.fromJson(json['Study']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Rank'] = this.rank;
    if (this.study != null) {
      data['Study'] = this.study.toJson();
    }
    return data;
  }
}
