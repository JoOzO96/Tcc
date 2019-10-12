class Quimicos {
  // List<Null> atcClassifications;
  String availabilityType;
  // Null biotherapeutic;
  String blackBoxWarning;
  int chebiParId;
  String chirality;
  List<CrossReferences> crossReferences;
  bool dosedIngredient;
  int firstApproval;
  String firstInClass;
  // Null helmNotation;
  // Null indicationClass;
  String inorganicFlag;
  int maxPhase;
  String moleculeChemblId;
  MoleculeHierarchy moleculeHierarchy;
  MoleculeProperties moleculeProperties;
  MoleculeStructures moleculeStructures;
  List<MoleculeSynonyms> moleculeSynonyms;
  String moleculeType;
  String naturalProduct;
  bool oral;
  bool parenteral;
  bool polymerFlag;
  String prefName;
  String prodrug;
  String structureType;
  bool therapeuticFlag;
  bool topical;
  String usanStem;
  String usanStemDefinition;
  String usanSubstem;
  int usanYear;
  String withdrawnClass;
  String withdrawnCountry;
  bool withdrawnFlag;
  String withdrawnReason;
  String withdrawnYear;

  Quimicos(
      {
        // this.atcClassifications,
      this.availabilityType,
      // this.biotherapeutic,
      this.blackBoxWarning,
      this.chebiParId,
      this.chirality,
      this.crossReferences,
      this.dosedIngredient,
      this.firstApproval,
      this.firstInClass,
      // this.helmNotation,
      // this.indicationClass,
      this.inorganicFlag,
      this.maxPhase,
      this.moleculeChemblId,
      this.moleculeHierarchy,
      this.moleculeProperties,
      this.moleculeStructures,
      this.moleculeSynonyms,
      this.moleculeType,
      this.naturalProduct,
      this.oral,
      this.parenteral,
      this.polymerFlag,
      this.prefName,
      this.prodrug,
      this.structureType,
      this.therapeuticFlag,
      this.topical,
      this.usanStem,
      this.usanStemDefinition,
      this.usanSubstem,
      this.usanYear,
      this.withdrawnClass,
      this.withdrawnCountry,
      this.withdrawnFlag,
      this.withdrawnReason,
      this.withdrawnYear});

  Quimicos.fromJson(Map<String, dynamic> json) {
    // if (json['atc_classifications'] != null) {
    //   atcClassifications = new List<Null>();
    //   json['atc_classifications'].forEach((v) {
    //     // atcClassifications.add(new Null.fromJson(v));
    //   });
    // }
    availabilityType = json['availability_type'];
    // biotherapeutic = json['biotherapeutic'];
    blackBoxWarning = json['black_box_warning'];
    chebiParId = json['chebi_par_id'];
    chirality = json['chirality'];
    if (json['cross_references'] != null) {
      crossReferences = new List<CrossReferences>();
      json['cross_references'].forEach((v) {
        crossReferences.add(new CrossReferences.fromJson(v));
      });
    }
    dosedIngredient = json['dosed_ingredient'] != null ? json['dosed_ingredient'] : false ;
    firstApproval = json['first_approval'];
    firstInClass = json['first_in_class'];
    // helmNotation = json['helm_notation'];
    // indicationClass = json['indication_class'];
    inorganicFlag = json['inorganic_flag'];
    maxPhase = json['max_phase'];
    moleculeChemblId = json['molecule_chembl_id'].toString();
    moleculeHierarchy = json['molecule_hierarchy'] != null
        ? new MoleculeHierarchy.fromJson(json['molecule_hierarchy'])
        : null;
    moleculeProperties = json['molecule_properties'] != null
        ? new MoleculeProperties.fromJson(json['molecule_properties'])
        : null;
    moleculeStructures = json['molecule_structures'] != null
        ? new MoleculeStructures.fromJson(json['molecule_structures'])
        : null;
    if (json['molecule_synonyms'] != null) {
      moleculeSynonyms = new List<MoleculeSynonyms>();
      json['molecule_synonyms'].forEach((v) {
        moleculeSynonyms.add(new MoleculeSynonyms.fromJson(v));
      });
    }
    moleculeType = json['molecule_type'];
    naturalProduct = json['natural_product'];
    oral = json['oral'] != null ? json['oral'] : false ;
    parenteral = json['parenteral'] != null ? json['parenteral'] : false;
    polymerFlag = json['polymer_flag'] != null ? json['polymer_flag'] : false;
    prefName = json['pref_name'] != null ? json['pref_name'] : "No name" ;
    prodrug = json['prodrug'];
    structureType = json['structure_type'];
    therapeuticFlag = json['therapeutic_flag'] != null ? json['therapeutic_flag'] : false;
    topical = json['topical'] != null ? json['topical'] : false;
    usanStem = json['usan_stem'];
    usanStemDefinition = json['usan_stem_definition'];
    usanSubstem = json['usan_substem'];
    usanYear = json['usan_year'];
    withdrawnClass = json['withdrawn_class'];
    withdrawnCountry = json['withdrawn_country'];
    withdrawnFlag = json['withdrawn_flag'] != null ? json['withdrawn_flag'] : false;
    withdrawnReason = json['withdrawn_reason'];
    withdrawnYear = json['withdrawn_year'];
  }
}

class CrossReferences {
  String xrefId;
  String xrefName;
  String xrefSrc;

  CrossReferences({this.xrefId, this.xrefName, this.xrefSrc});

  CrossReferences.fromJson(Map<String, dynamic> json) {
    xrefId = json['xref_id'];
    xrefName = json['xref_name'];
    xrefSrc = json['xref_src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xref_id'] = this.xrefId;
    data['xref_name'] = this.xrefName;
    data['xref_src'] = this.xrefSrc;
    return data;
  }
}

class MoleculeHierarchy {
  String moleculeChemblId;
  String parentChemblId;

  MoleculeHierarchy({this.moleculeChemblId, this.parentChemblId});

  MoleculeHierarchy.fromJson(Map<String, dynamic> json) {
    moleculeChemblId = json['molecule_chembl_id'];
    parentChemblId = json['parent_chembl_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['molecule_chembl_id'] = this.moleculeChemblId;
    data['parent_chembl_id'] = this.parentChemblId;
    return data;
  }
}

class MoleculeProperties {
  String acdLogd;
  String acdLogp;
  String acdMostApka;
  String acdMostBpka;
  String alogp;
  int aromaticRings;
  String fullMolformula;
  String fullMwt;
  int hba;
  int hbaLipinski;
  int hbd;
  int hbdLipinski;
  int heavyAtoms;
  String molecularSpecies;
  String mwFreebase;
  String mwMonoisotopic;
  int numLipinskiRo5Violations;
  int numRo5Violations;
  String psa;
  String qedWeighted;
  String ro3Pass;
  int rtb;

  MoleculeProperties(
      {this.acdLogd,
      this.acdLogp,
      this.acdMostApka,
      this.acdMostBpka,
      this.alogp,
      this.aromaticRings,
      this.fullMolformula,
      this.fullMwt,
      this.hba,
      this.hbaLipinski,
      this.hbd,
      this.hbdLipinski,
      this.heavyAtoms,
      this.molecularSpecies,
      this.mwFreebase,
      this.mwMonoisotopic,
      this.numLipinskiRo5Violations,
      this.numRo5Violations,
      this.psa,
      this.qedWeighted,
      this.ro3Pass,
      this.rtb});

  MoleculeProperties.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      acdLogd = json['acd_logd'];
      acdLogp = json['acd_logp'];
      acdMostApka = json['acd_most_apka'];
      acdMostBpka = json['acd_most_bpka'];
      alogp = json['alogp'];
      aromaticRings = json['aromatic_rings'];
      fullMolformula = json['full_molformula'];
      fullMwt = json['full_mwt'];
      hba = json['hba'];
      hbaLipinski = json['hba_lipinski'];
      hbd = json['hbd'];
      hbdLipinski = json['hbd_lipinski'];
      heavyAtoms = json['heavy_atoms'];
      molecularSpecies = json['molecular_species'];
      mwFreebase = json['mw_freebase'];
      mwMonoisotopic = json['mw_monoisotopic'];
      numLipinskiRo5Violations = json['num_lipinski_ro5_violations'];
      numRo5Violations = json['num_ro5_violations'];
      psa = json['psa'];
      qedWeighted = json['qed_weighted'];
      ro3Pass = json['ro3_pass'];
      rtb = json['rtb'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acd_logd'] = this.acdLogd;
    data['acd_logp'] = this.acdLogp;
    data['acd_most_apka'] = this.acdMostApka;
    data['acd_most_bpka'] = this.acdMostBpka;
    data['alogp'] = this.alogp;
    data['aromatic_rings'] = this.aromaticRings;
    data['full_molformula'] = this.fullMolformula;
    data['full_mwt'] = this.fullMwt;
    data['hba'] = this.hba;
    data['hba_lipinski'] = this.hbaLipinski;
    data['hbd'] = this.hbd;
    data['hbd_lipinski'] = this.hbdLipinski;
    data['heavy_atoms'] = this.heavyAtoms;
    data['molecular_species'] = this.molecularSpecies;
    data['mw_freebase'] = this.mwFreebase;
    data['mw_monoisotopic'] = this.mwMonoisotopic;
    data['num_lipinski_ro5_violations'] = this.numLipinskiRo5Violations;
    data['num_ro5_violations'] = this.numRo5Violations;
    data['psa'] = this.psa;
    data['qed_weighted'] = this.qedWeighted;
    data['ro3_pass'] = this.ro3Pass;
    data['rtb'] = this.rtb;
    return data;
  }
}

class MoleculeStructures {
  String canonicalSmiles;
  String standardInchi;
  String standardInchiKey;

  MoleculeStructures(
      {this.canonicalSmiles, this.standardInchi, this.standardInchiKey});

  MoleculeStructures.fromJson(Map<String, dynamic> json) {
    canonicalSmiles = json['canonical_smiles'];
    standardInchi = json['standard_inchi'];
    standardInchiKey = json['standard_inchi_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['canonical_smiles'] = this.canonicalSmiles;
    data['standard_inchi'] = this.standardInchi;
    data['standard_inchi_key'] = this.standardInchiKey;
    return data;
  }
}

class MoleculeSynonyms {
  String moleculeSynonym;
  String synType;
  String synonyms;

  MoleculeSynonyms({this.moleculeSynonym, this.synType, this.synonyms});

  MoleculeSynonyms.fromJson(Map<String, dynamic> json) {
    moleculeSynonym = json['molecule_synonym'];
    synType = json['syn_type'];
    synonyms = json['synonyms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['molecule_synonym'] = this.moleculeSynonym;
    data['syn_type'] = this.synType;
    data['synonyms'] = this.synonyms;
    return data;
  }
}
