import 'package:unidb/Classes/drugtarget/bioactivities.dart';
import 'package:unidb/Classes/drugtarget/meta.dart';

class DrugTarget {
  List<Bioactivities> bioactivities;
  Meta meta;

  DrugTarget({this.bioactivities, this.meta});

  DrugTarget.fromJson(Map<String, dynamic> json) {
    if (json['bioactivities'] != null) {
      bioactivities = new List<Bioactivities>();
      json['bioactivities'].forEach((v) {
        bioactivities.add(new Bioactivities.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bioactivities != null) {
      data['bioactivities'] =
          this.bioactivities.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}