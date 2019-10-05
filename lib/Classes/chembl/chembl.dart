class Chembl {
  ChemblIdLookup chemblIdLookup;

  Chembl({this.chemblIdLookup});

  Chembl.fromJson(Map<String, dynamic> json) {
    chemblIdLookup = json['chembl_id_lookup'] != null
        ? new ChemblIdLookup.fromJson(json['chembl_id_lookup'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chemblIdLookup != null) {
      data['chembl_id_lookup'] = this.chemblIdLookup.toJson();
    }
    return data;
  }
}

class ChemblIdLookup {
  String chemblId;
  String entityType;
  String resourceUrl;
  String status;

  ChemblIdLookup(
      {this.chemblId, this.entityType, this.resourceUrl, this.status});

  ChemblIdLookup.fromJson(Map<String, dynamic> json) {
    chemblId = json['chembl_id'];
    entityType = json['entity_type'];
    resourceUrl = json['resource_url'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chembl_id'] = this.chemblId;
    data['entity_type'] = this.entityType;
    data['resource_url'] = this.resourceUrl;
    data['status'] = this.status;
    return data;
  }
}
