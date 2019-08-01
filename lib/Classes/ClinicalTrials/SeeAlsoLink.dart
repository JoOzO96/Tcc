class SeeAlsoLink{
  String seeAlsoLinkLabel;
  String seeAlsoLinkURL;

  SeeAlsoLink({String seeAlsoLinkLabel, String seeAlsoLinkURL}){
    this.seeAlsoLinkLabel = seeAlsoLinkLabel;
    this.seeAlsoLinkURL = seeAlsoLinkURL;
  }

  SeeAlsoLink.fromJson(Map<String, dynamic> json){
    seeAlsoLinkLabel = json['SeeAlsoLinkLabel'];
    seeAlsoLinkURL = json['SeeAlsoLinkURL'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SeeAlsoLinkLabel'] = this.seeAlsoLinkLabel;
    data['SeeAlsoLinkURL'] = this.seeAlsoLinkURL;
    return data;
  }
}