import 'SeeAlsoLink.dart';

class SeeAlsoLinkList{
  List<SeeAlsoLink> seeAlsoLink;

  SeeAlsoLinkList({List<SeeAlsoLink> seeAlsoLink}){
    this.seeAlsoLink = seeAlsoLink;
  }

  SeeAlsoLinkList.fromJson(Map<String, dynamic> json){
    if (json['SeeAlsoLink'] != null){
      seeAlsoLink = new List<SeeAlsoLink>();
      json['SeeAlsoLink'].forEach((v){
        seeAlsoLink.add(new SeeAlsoLink.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seeAlsoLink != null){
      data['SeeAlsoLink'] = this.seeAlsoLink.map((v) => v.toJson()).toList();
    }
    return data;
  }
}