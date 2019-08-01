
class UnpostedEvent{
  String unpostedEventType;
  String unpostedEventDate;

  UnpostedEvent({String unpostedEventType, String unpostedEventDate}){
    this.unpostedEventType = unpostedEventType;
    this.unpostedEventDate = unpostedEventDate;
  }

  UnpostedEvent.fromJson(Map<String, dynamic> json){
    unpostedEventType = json['UnpostedEventType'];
    unpostedEventDate = json['UnpostedEventDate'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UnpostedEventType'] = this.unpostedEventType;
    data['UnpostedEventDate'] = this.unpostedEventDate;
    return data;
  }
}