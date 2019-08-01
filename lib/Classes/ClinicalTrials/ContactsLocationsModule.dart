import 'LocationList.dart';
import 'OverallOfficialList.dart';

class ContactsLocationsModule{
  OverallOfficialList overallOfficialList;
  LocationList locationList;

  ContactsLocationsModule(
     {OverallOfficialList overallOfficialList, LocationList locationList}){
    this.overallOfficialList = overallOfficialList;
    this.locationList = locationList;
  }

  ContactsLocationsModule.fromJson(Map<String, dynamic> json){
    overallOfficialList = json['OverallOfficialList'] != null
        ? new OverallOfficialList.fromJson(json['OverallOfficialList'])
        : null;
    locationList = json['LocationList'] != null
        ? new LocationList.fromJson(json['LocationList'])
        : null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.overallOfficialList != null){
      data['OverallOfficialList'] = this.overallOfficialList.toJson();
    }
    if (this.locationList != null){
      data['LocationList'] = this.locationList.toJson();
    }
    return data;
  }
}