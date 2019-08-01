class StdAgeList{
  List<String> stdAge;

  StdAgeList({List<String> stdAge}){
    this.stdAge = stdAge;
  }
  
  StdAgeList.fromJson(Map<String, dynamic> json){
    stdAge = json['StdAge'].cast<String>();
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StdAge'] = this.stdAge;
    return data;
  }
}