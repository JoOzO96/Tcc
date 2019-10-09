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
