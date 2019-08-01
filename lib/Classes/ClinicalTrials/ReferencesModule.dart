import 'SeeAlsoLinkList.dart';

class ReferencesModule{
  SeeAlsoLinkList seeAlsoLinkList;

  ReferencesModule({SeeAlsoLinkList seeAlsoLinkList}){
    this.seeAlsoLinkList = seeAlsoLinkList;
  }
  ReferencesModule.fromJson(Map<String, dynamic> json){
    seeAlsoLinkList = json['SeeAlsoLinkList'] != null
        ? new SeeAlsoLinkList.fromJson(json['SeeAlsoLinkList'])
        : null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seeAlsoLinkList != null){
      data['SeeAlsoLinkList'] = this.seeAlsoLinkList.toJson();
    }
    return data;
  }
}