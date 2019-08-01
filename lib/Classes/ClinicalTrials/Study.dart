import 'AnnotationSection.dart';
import 'DerivedSection.dart';
import 'ProtocolSection.dart';

class Study {
  ProtocolSection protocolSection;
  AnnotationSection annotationSection;
  DerivedSection derivedSection;

  Study(
      {ProtocolSection protocolSection,
      AnnotationSection annotationSection,
      DerivedSection derivedSection}) {
    this.protocolSection = protocolSection;
    this.annotationSection = annotationSection;
    this.derivedSection = derivedSection;
  }
  Study.fromJson(Map<String, dynamic> json) {
    protocolSection = json['ProtocolSection'] != null
        ? new ProtocolSection.fromJson(json['ProtocolSection'])
        : null;
    annotationSection = json['AnnotationSection'] != null
        ? new AnnotationSection.fromJson(json['AnnotationSection'])
        : null;
    derivedSection = json['DerivedSection'] != null
        ? new DerivedSection.fromJson(json['DerivedSection'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.protocolSection != null) {
      data['ProtocolSection'] = this.protocolSection.toJson();
    }
    if (this.annotationSection != null) {
      data['AnnotationSection'] = this.annotationSection.toJson();
    }
    if (this.derivedSection != null) {
      data['DerivedSection'] = this.derivedSection.toJson();
    }
    return data;
  }
}