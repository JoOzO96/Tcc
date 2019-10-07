class ChemblMolecule {
  Molecule molecule;

  ChemblMolecule({this.molecule});

  ChemblMolecule.fromJson(Map<String, dynamic> json) {
    molecule = json['molecule'] != null
        ? new Molecule.fromJson(json['molecule'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.molecule != null) {
      data['molecule'] = this.molecule.toJson();
    }
    return data;
  }
}

class Molecule {
  AtcClassifications atcClassifications;
  String availabilityType;
  // Bioterapeutic biotherapeutic;
  String blackBoxWarning;
  String chebiParId;
  String chirality;
  CrossReferences crossReferences;
  bool dosedIngredient;
  String firstApproval;
  String firstInClass;
  String helmNotation;
  String indicationClass;
  String inorganicFlag;
  String maxPhase;
  String moleculeChemblId;
  MoleculeHierarchy moleculeHierarchy;
  MoleculeProperties moleculeProperties;
  MoleculeStructures moleculeStructures;
  MoleculeSynonyms moleculeSynonyms;
  String moleculeType;
  String naturalProduct;
  bool oral;
  String parenteral;
  String polymerFlag;
  String prefName;
  String prodrug;
  String structureType;
  bool therapeuticFlag;
  String topical;
  String usanStem;
  String usanStemDefinition;
  String usanSubstem;
  String usanYear;
  String withdrawnClass;
  String withdrawnCountry;
  String withdrawnFlag;
  String withdrawnReason;
  String withdrawnYear;

  Molecule(
      {this.atcClassifications,
      this.availabilityType,
      // this.biotherapeutic,
      this.blackBoxWarning,
      this.chebiParId,
      this.chirality,
      this.crossReferences,
      this.dosedIngredient,
      this.firstApproval,
      this.firstInClass,
      this.helmNotation,
      this.indicationClass,
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

  Molecule.fromJson(Map<String, dynamic> json) {
    atcClassifications = json['atc_classifications'] != null
        ? new AtcClassifications.fromJson(json['atc_classifications'])
        : null;
    availabilityType = json['availability_type'];
    // biotherapeutic = json['biotherapeutic'];
    blackBoxWarning = json['black_box_warning'];
    chebiParId = json['chebi_par_id'];
    chirality = json['chirality'];
    crossReferences = json['cross_references'] != null
        ? new CrossReferences.fromJson(json['cross_references'])
        : null;
    dosedIngredient =
        json['dosed_ingredient'].toString().toLowerCase() == "true";
    firstApproval = json['first_approval'];
    firstInClass = json['first_in_class'];
    helmNotation = json['helm_notation'];
    indicationClass = json['indication_class'];
    inorganicFlag = json['inorganic_flag'];
    maxPhase = json['max_phase'];
    moleculeChemblId = json['molecule_chembl_id'];
    moleculeHierarchy = json['molecule_hierarchy'] != null
        ? new MoleculeHierarchy.fromJson(json['molecule_hierarchy'])
        : null;
    moleculeProperties = json['molecule_properties'] != null
        ? new MoleculeProperties.fromJson(json['molecule_properties'])
        : null;
    moleculeStructures = json['molecule_structures'] != null
        ? new MoleculeStructures.fromJson(json['molecule_structures'])
        : null;
    moleculeSynonyms = json['molecule_synonyms'] != null
        ? new MoleculeSynonyms.fromJson(json['molecule_synonyms'])
        : null;
    moleculeType = json['molecule_type'];
    naturalProduct = json['natural_product'];
    oral = json['oral'] != null
        ? json['oral'].toString().toLowerCase() == "true"
        : false;
    parenteral = json['parenteral'];
    polymerFlag = json['polymer_flag'];
    prefName = json['pref_name'] != null ? json['pref_name'] : "No name";
    prodrug = json['prodrug'];
    structureType = json['structure_type'];
    therapeuticFlag = json['therapeutic_flag'] != null
        ? json['therapeutic_flag'].toString().toLowerCase() == "true"
        : null;
    topical = json['topical'];
    usanStem = json['usan_stem'];
    usanStemDefinition = json['usan_stem_definition'];
    usanSubstem = json['usan_substem'];
    usanYear = json['usan_year'];
    withdrawnClass = json['withdrawn_class'];
    withdrawnCountry = json['withdrawn_country'];
    withdrawnFlag = json['withdrawn_flag'];
    withdrawnReason = json['withdrawn_reason'];
    withdrawnYear = json['withdrawn_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['atc_classifications'] = this.atcClassifications;
    data['availability_type'] = this.availabilityType;
    // data['biotherapeutic'] = this.biotherapeutic;
    data['black_box_warning'] = this.blackBoxWarning;
    data['chebi_par_id'] = this.chebiParId;
    data['chirality'] = this.chirality;
    data['cross_references'] = this.crossReferences;
    data['dosed_ingredient'] = this.dosedIngredient;
    data['first_approval'] = this.firstApproval;
    data['first_in_class'] = this.firstInClass;
    data['helm_notation'] = this.helmNotation;
    data['indication_class'] = this.indicationClass;
    data['inorganic_flag'] = this.inorganicFlag;
    data['max_phase'] = this.maxPhase;
    data['molecule_chembl_id'] = this.moleculeChemblId;
    if (this.moleculeHierarchy != null) {
      data['molecule_hierarchy'] = this.moleculeHierarchy.toJson();
    }
    if (this.moleculeProperties != null) {
      data['molecule_properties'] = this.moleculeProperties.toJson();
    }
    if (this.moleculeStructures != null) {
      data['molecule_structures'] = this.moleculeStructures.toJson();
    }
    data['molecule_synonyms'] = this.moleculeSynonyms;
    data['molecule_type'] = this.moleculeType;
    data['natural_product'] = this.naturalProduct;
    data['oral'] = this.oral;
    data['parenteral'] = this.parenteral;
    data['polymer_flag'] = this.polymerFlag;
    data['pref_name'] = this.prefName;
    data['prodrug'] = this.prodrug;
    data['structure_type'] = this.structureType;
    data['therapeutic_flag'] = this.therapeuticFlag;
    data['topical'] = this.topical;
    data['usan_stem'] = this.usanStem;
    data['usan_stem_definition'] = this.usanStemDefinition;
    data['usan_substem'] = this.usanSubstem;
    data['usan_year'] = this.usanYear;
    data['withdrawn_class'] = this.withdrawnClass;
    data['withdrawn_country'] = this.withdrawnCountry;
    data['withdrawn_flag'] = this.withdrawnFlag;
    data['withdrawn_reason'] = this.withdrawnReason;
    data['withdrawn_year'] = this.withdrawnYear;
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

class Bioterapeutic{
  
}

class CrossReferences {
  List<MoleculeChemicals> molecule;

  CrossReferences({this.molecule});

  CrossReferences.fromJson(Map<String, dynamic> json) {
    molecule = new List<MoleculeChemicals>();
    if (json['molecule'].toString().startsWith("[")) {
      if (json['molecule'] != null) {
        json['molecule'].forEach((v) {
          molecule.add(new MoleculeChemicals.fromJson(v));
        });
      }
    } else {
      molecule.add(new MoleculeChemicals.fromJson(json['molecule']));
    }
  }
}

class MoleculeChemicals {
  String xrefId;
  String xrefName;
  String xrefSrc;

  MoleculeChemicals({this.xrefId, this.xrefName, this.xrefSrc});

  MoleculeChemicals.fromJson(Map<String, dynamic> json) {
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

class AtcClassifications {
  String level5;

  AtcClassifications({this.level5});

  AtcClassifications.fromJson(Map<String, dynamic> json) {
    level5 = json['level5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level5'] = this.level5;
    return data;
  }
}

class MoleculeProperties {
  String acdLogd;
  String acdLogp;
  String acdMostApka;
  String acdMostBpka;
  String alogp;
  String aromaticRings;
  String fullMolformula;
  String fullMwt;
  String hba;
  String hbaLipinski;
  String hbd;
  String hbdLipinski;
  String heavyAtoms;
  String molecularSpecies;
  String mwFreebase;
  String mwMonoisotopic;
  String numLipinskiRo5Violations;
  String numRo5Violations;
  String psa;
  String qedWeighted;
  String ro3Pass;
  String rtb;

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

class MoleculeSynonyms {
  List<Synonym> synonym;

  MoleculeSynonyms({this.synonym});

  MoleculeSynonyms.fromJson(Map<String, dynamic> json) {
    if (json['synonym'] != null) {
      synonym = new List<Synonym>();
      if (json['synonym'].toString().startsWith("[")) {
        json['synonym'].forEach((f) {
          synonym.add(new Synonym.fromJson(f));
        });
      } else {
        synonym.add(new Synonym.fromJson(json['synonym']));
      }
    }
  }
  // MoleculeSynonyms.fromJson(Map<String, dynamic> json) {
  //   synonym =
  //       json['synonym'] != null ? new Synonym.fromJson(json['synonym']) : null;
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.synonym != null) {
      data['synonym'] = this.synonym.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Synonym {
  String moleculeSynonym;
  String synType;
  String synonyms;

  Synonym({this.moleculeSynonym, this.synType, this.synonyms});

  Synonym.fromJson(Map<String, dynamic> json) {
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
