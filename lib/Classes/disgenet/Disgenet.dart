// To parse this JSON data, do
//
//     final disgenet = disgenetFromJson(jsonString);

import 'dart:convert';

List<Disgenet> disgenetFromJson(String str) => List<Disgenet>.from(json.decode(str).map((x) => Disgenet.fromJson(x)));

String disgenetToJson(List<Disgenet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Disgenet {
    int geneid;
    String geneSymbol;
    String uniprotid;
    double geneDsi;
    double geneDpi;
    double genePli;
    String proteinClass;
    String proteinClassName;
    DiseaseName diseaseName;
    DiseaseClass diseaseClass;
    DiseaseClassName diseaseClassName;
    DiseaseType diseaseType;
    DiseaseSemanticType diseaseSemanticType;
    Source source;
    El el;
    double ei;
    int yearInitial;
    int yearFinal;
    double score;
    Diseaseid diseaseid;

    Disgenet({
        this.geneid,
        this.geneSymbol,
        this.uniprotid,
        this.geneDsi,
        this.geneDpi,
        this.genePli,
        this.proteinClass,
        this.proteinClassName,
        this.diseaseName,
        this.diseaseClass,
        this.diseaseClassName,
        this.diseaseType,
        this.diseaseSemanticType,
        this.source,
        this.el,
        this.ei,
        this.yearInitial,
        this.yearFinal,
        this.score,
        this.diseaseid,
    });

    factory Disgenet.fromJson(Map<String, dynamic> json) => Disgenet(
        geneid: json["geneid"],
        geneSymbol: json["gene_symbol"],
        uniprotid: json["uniprotid"] == null ? null : json["uniprotid"],
        geneDsi: json["gene_dsi"].toDouble(),
        geneDpi: json["gene_dpi"].toDouble(),
        genePli: json["gene_pli"] == null ? null : json["gene_pli"].toDouble(),
        proteinClass: json["protein_class"] == null ? null : json["protein_class"],
        proteinClassName: json["protein_class_name"] == null ? null : json["protein_class_name"],
        diseaseName: diseaseNameValues.map[json["disease_name"]],
        diseaseClass: diseaseClassValues.map[json["disease_class"]],
        diseaseClassName: diseaseClassNameValues.map[json["disease_class_name"]],
        diseaseType: diseaseTypeValues.map[json["disease_type"]],
        diseaseSemanticType: diseaseSemanticTypeValues.map[json["disease_semantic_type"]],
        source: sourceValues.map[json["source"]],
        el: elValues.map[json["el"]],
        ei: json["ei"] == null ? null : json["ei"].toDouble(),
        yearInitial: json["year_initial"] == null ? null : json["year_initial"],
        yearFinal: json["year_final"] == null ? null : json["year_final"],
        score: json["score"].toDouble(),
        diseaseid: diseaseidValues.map[json["diseaseid"]],
    );

    Map<String, dynamic> toJson() => {
        "geneid": geneid,
        "gene_symbol": geneSymbol,
        "uniprotid": uniprotid == null ? null : uniprotid,
        "gene_dsi": geneDsi,
        "gene_dpi": geneDpi,
        "gene_pli": genePli == null ? null : genePli,
        "protein_class": proteinClass == null ? null : proteinClass,
        "protein_class_name": proteinClassName == null ? null : proteinClassName,
        "disease_name": diseaseNameValues.reverse[diseaseName],
        "disease_class": diseaseClassValues.reverse[diseaseClass],
        "disease_class_name": diseaseClassNameValues.reverse[diseaseClassName],
        "disease_type": diseaseTypeValues.reverse[diseaseType],
        "disease_semantic_type": diseaseSemanticTypeValues.reverse[diseaseSemanticType],
        "source": sourceValues.reverse[source],
        "el": elValues.reverse[el],
        "ei": ei == null ? null : ei,
        "year_initial": yearInitial == null ? null : yearInitial,
        "year_final": yearFinal == null ? null : yearFinal,
        "score": score,
        "diseaseid": diseaseidValues.reverse[diseaseid],
    };
}

enum DiseaseClass { C18 }

final diseaseClassValues = EnumValues({
    "C18": DiseaseClass.C18
});

enum DiseaseClassName { NUTRITIONAL_AND_METABOLIC_DISEASES }

final diseaseClassNameValues = EnumValues({
    "Nutritional and Metabolic Diseases": DiseaseClassName.NUTRITIONAL_AND_METABOLIC_DISEASES
});

enum DiseaseName { DYSLIPIDEMIAS }

final diseaseNameValues = EnumValues({
    "Dyslipidemias": DiseaseName.DYSLIPIDEMIAS
});

enum DiseaseSemanticType { DISEASE_OR_SYNDROME }

final diseaseSemanticTypeValues = EnumValues({
    "Disease or Syndrome": DiseaseSemanticType.DISEASE_OR_SYNDROME
});

enum DiseaseType { GROUP }

final diseaseTypeValues = EnumValues({
    "group": DiseaseType.GROUP
});

enum Diseaseid { C0242339 }

final diseaseidValues = EnumValues({
    "C0242339": Diseaseid.C0242339
});

enum El { NO_REPORTED_EVIDENCE }

final elValues = EnumValues({
    "no reported evidence": El.NO_REPORTED_EVIDENCE
});

enum Source { ALL }

final sourceValues = EnumValues({
    "ALL": Source.ALL
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
