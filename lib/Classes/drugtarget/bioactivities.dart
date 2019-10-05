class Bioactivities {
  String activityComment;
  String annotated;
  String annotationComments;
  String assayCellType;
  String assayFormat;
  String assaySubType;
  String assayType;
  String authors;
  String chemblId;
  String compoundConcentrationValue;
  String compoundConcentrationValueUnit;
  String compoundName;
  String detectionTechnology;
  String endpointActionmode;
  String endpointStandardRelation;
  String endpointStandardType;
  String endpointStandardUnits;
  String endpointStandardValue;
  String geneName;
  String inhibitorType;
  String maxPhase;
  String mutationInfo;
  String proteinClass;
  String pubmedId;
  String resourceUri;
  String targetOrganism;
  String targetPrefName;
  String uniprotId;
  String wildtypeOrMutant;

  Bioactivities(
      {this.activityComment,
      this.annotated,
      this.annotationComments,
      this.assayCellType,
      this.assayFormat,
      this.assaySubType,
      this.assayType,
      this.authors,
      this.chemblId,
      this.compoundConcentrationValue,
      this.compoundConcentrationValueUnit,
      this.compoundName,
      this.detectionTechnology,
      this.endpointActionmode,
      this.endpointStandardRelation,
      this.endpointStandardType,
      this.endpointStandardUnits,
      this.endpointStandardValue,
      this.geneName,
      this.inhibitorType,
      this.maxPhase,
      this.mutationInfo,
      this.proteinClass,
      this.pubmedId,
      this.resourceUri,
      this.targetOrganism,
      this.targetPrefName,
      this.uniprotId,
      this.wildtypeOrMutant});

  Bioactivities.fromJson(Map<String, dynamic> json) {
    activityComment = json['activity_comment'] != null ? json['activity_comment'] : "";
    annotated = json['annotated'];
    annotationComments = json['annotation_comments'];
    assayCellType = json['assay_cell_type'];
    assayFormat = json['assay_format'];
    assaySubType = json['assay_sub_type'];
    assayType = json['assay_type'];
    authors = json['authors'];
    chemblId = json['chembl_id'];
    compoundConcentrationValue = json['compound_concentration_value'];
    compoundConcentrationValueUnit = json['compound_concentration_value_unit'];
    compoundName = json['compound_name'];
    detectionTechnology = json['detection_technology'];
    endpointActionmode = json['endpoint_actionmode'];
    endpointStandardRelation = json['endpoint_standard_relation'];
    endpointStandardType = json['endpoint_standard_type'];
    endpointStandardUnits = json['endpoint_standard_units'];
    endpointStandardValue = json['endpoint_standard_value'];
    geneName = json['gene_name'];
    inhibitorType = json['inhibitor_type'];
    maxPhase = json['max_phase'];
    mutationInfo = json['mutation_info'];
    proteinClass = json['protein_class'];
    pubmedId = json['pubmed_id'];
    resourceUri = json['resource_uri'];
    targetOrganism = json['target_organism'];
    targetPrefName = json['target_pref_name'];
    uniprotId = json['uniprot_id'];
    wildtypeOrMutant = json['wildtype_or_mutant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity_comment'] = this.activityComment;
    data['annotated'] = this.annotated;
    data['annotation_comments'] = this.annotationComments;
    data['assay_cell_type'] = this.assayCellType;
    data['assay_format'] = this.assayFormat;
    data['assay_sub_type'] = this.assaySubType;
    data['assay_type'] = this.assayType;
    data['authors'] = this.authors;
    data['chembl_id'] = this.chemblId;
    data['compound_concentration_value'] = this.compoundConcentrationValue;
    data['compound_concentration_value_unit'] =
        this.compoundConcentrationValueUnit;
    data['compound_name'] = this.compoundName;
    data['detection_technology'] = this.detectionTechnology;
    data['endpoint_actionmode'] = this.endpointActionmode;
    data['endpoint_standard_relation'] = this.endpointStandardRelation;
    data['endpoint_standard_type'] = this.endpointStandardType;
    data['endpoint_standard_units'] = this.endpointStandardUnits;
    data['endpoint_standard_value'] = this.endpointStandardValue;
    data['gene_name'] = this.geneName;
    data['inhibitor_type'] = this.inhibitorType;
    data['max_phase'] = this.maxPhase;
    data['mutation_info'] = this.mutationInfo;
    data['protein_class'] = this.proteinClass;
    data['pubmed_id'] = this.pubmedId;
    data['resource_uri'] = this.resourceUri;
    data['target_organism'] = this.targetOrganism;
    data['target_pref_name'] = this.targetPrefName;
    data['uniprot_id'] = this.uniprotId;
    data['wildtype_or_mutant'] = this.wildtypeOrMutant;
    return data;
  }
}