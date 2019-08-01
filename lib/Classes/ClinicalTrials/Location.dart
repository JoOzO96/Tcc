class Location{
  String locationFacility;
  String locationCity;
  String locationState;
  String locationZip;
  String locationCountry;

  Location(
     {String locationFacility,
      String locationCity,
      String locationState,
      String locationZip,
      String locationCountry}){
    this.locationFacility = locationFacility;
    this.locationCity = locationCity;
    this.locationState = locationState;
    this.locationZip = locationZip;
    this.locationCountry = locationCountry;
  }
  Location.fromJson(Map<String, dynamic> json){
    locationFacility = json['LocationFacility'];
    locationCity = json['LocationCity'];
    locationState = json['LocationState'];
    locationZip = json['LocationZip'];
    locationCountry = json['LocationCountry'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LocationFacility'] = this.locationFacility;
    data['LocationCity'] = this.locationCity;
    data['LocationState'] = this.locationState;
    data['LocationZip'] = this.locationZip;
    data['LocationCountry'] = this.locationCountry;
    return data;
  }
}