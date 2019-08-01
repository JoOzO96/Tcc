import 'UnpostedEventList.dart';

class AnnotationModule{
  UnpostedAnnotation unpostedAnnotation;

  AnnotationModule({UnpostedAnnotation unpostedAnnotation}){
    this.unpostedAnnotation = unpostedAnnotation;
  }

  AnnotationModule.fromJson(Map<String, dynamic> json){
    unpostedAnnotation = json['UnpostedAnnotation'] != null
        ? new UnpostedAnnotation.fromJson(json['UnpostedAnnotation'])
        : null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.unpostedAnnotation != null){
      data['UnpostedAnnotation'] = this.unpostedAnnotation.toJson();
    }
    return data;
  }
}

class UnpostedAnnotation{
  String unpostedResponsibleParty;
  UnpostedEventList unpostedEventList;

  UnpostedAnnotation(
     {String unpostedResponsibleParty, UnpostedEventList unpostedEventList}){
    this.unpostedResponsibleParty = unpostedResponsibleParty;
    this.unpostedEventList = unpostedEventList;
  }

  UnpostedAnnotation.fromJson(Map<String, dynamic> json){
    unpostedResponsibleParty = json['UnpostedResponsibleParty'];
    unpostedEventList = json['UnpostedEventList'] != null
        ? new UnpostedEventList.fromJson(json['UnpostedEventList'])
        : null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UnpostedResponsibleParty'] = this.unpostedResponsibleParty;
    if (this.unpostedEventList != null){
      data['UnpostedEventList'] = this.unpostedEventList.toJson();
    }
    return data;
  }
}