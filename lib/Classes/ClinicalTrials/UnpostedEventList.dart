import 'package:unidb/Classes/ClinicalTrials/UnpostedEvent.dart';

class UnpostedEventList{
  List<UnpostedEvent> unpostedEvent;

  UnpostedEventList({List<UnpostedEvent> unpostedEvent}){
    this.unpostedEvent = unpostedEvent;
  }

  UnpostedEventList.fromJson(Map<String, dynamic> json){
    if (json['UnpostedEvent'] != null){
      unpostedEvent = new List<UnpostedEvent>();
      json['UnpostedEvent'].forEach((v){
        unpostedEvent.add(new UnpostedEvent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.unpostedEvent != null){
      data['UnpostedEvent'] =
          this.unpostedEvent.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
