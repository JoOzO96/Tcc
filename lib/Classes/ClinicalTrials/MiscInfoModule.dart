class MiscInfoModule{
  String versionHolder;

  MiscInfoModule({String versionHolder}){
    this.versionHolder = versionHolder;
  }

  MiscInfoModule.fromJson(Map<String, dynamic> json){
    versionHolder = json['VersionHolder'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VersionHolder'] = this.versionHolder;
    return data;
  }
}