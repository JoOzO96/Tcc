class KeywordList {
  List<String> keyword;

  KeywordList({List<String> keyword}) {
    this.keyword = keyword;
  }
  
  KeywordList.fromJson(Map<String, dynamic> json) {
    keyword = json['Keyword'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Keyword'] = this.keyword;
    return data;
  }
}