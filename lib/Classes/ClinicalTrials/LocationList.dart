import 'Location.dart';

class LocationList{
  List<Location> location;

  LocationList({List<Location> location}){
    this.location = location;
  }
  LocationList.fromJson(Map<String, dynamic> json){
    if (json['Location'] != null){
      location = new List<Location>();
      json['Location'].forEach((v){
        location.add(new Location.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null){
      data['Location'] = this.location.map((v) => v.toJson()).toList();
    }
    return data;
  }
}