class OversightModule {
  String oversightHasDMC;

  OversightModule({String oversightHasDMC}) {
    this.oversightHasDMC = oversightHasDMC;
  }

  OversightModule.fromJson(Map<String, dynamic> json) {
    oversightHasDMC = json['OversightHasDMC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OversightHasDMC'] = this.oversightHasDMC;
    return data;
  }
}