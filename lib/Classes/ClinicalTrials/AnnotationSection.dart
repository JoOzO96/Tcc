import 'AnnotationModule.dart';

class AnnotationSection{
  AnnotationModule annotationModule;

  AnnotationSection({AnnotationModule annotationModule}){
    this.annotationModule = annotationModule;
  }

  AnnotationSection.fromJson(Map<String, dynamic> json){
    annotationModule = json['AnnotationModule'] != null
        ? new AnnotationModule.fromJson(json['AnnotationModule'])
        : null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.annotationModule != null){
      data['AnnotationModule'] = this.annotationModule.toJson();
    }
    return data;
  }
}