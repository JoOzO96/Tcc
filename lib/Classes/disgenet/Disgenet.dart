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
    String diseaseName;
    String diseaseClass;
    String diseaseClassName;
    String diseaseType;
    String diseaseSemanticType;
    String source;
    String el;
    double ei;
    int yearInitial;
    int yearFinal;
    double score;
    String diseaseid;

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
        geneDsi: json["gene_dsi"] == null ? null : json["gene_dsi"].toDouble(),
        geneDpi: json["gene_dpi"] == null ? null : json["gene_dpi"].toDouble(),
        genePli: json["gene_pli"] == null ? null : json["gene_pli"].toDouble(),
        proteinClass: json["protein_class"] == null ? null : json["protein_class"],
        proteinClassName: json["protein_class_name"] == null ? null : json["protein_class_name"],
        diseaseName: json["disease_name"],
        diseaseClass: json["disease_class"],
        diseaseClassName: json["disease_class_name"],
        diseaseType: json["disease_type"],
        diseaseSemanticType: json["disease_semantic_type"],
        source: json["source"],
        el: json["el"],
        ei: json["ei"] == null ? null : json["ei"].toDouble(),
        yearInitial: json["year_initial"] == null ? null : json["year_initial"],
        yearFinal: json["year_final"] == null ? null : json["year_final"],
        score: json["score"] == null ? 0 : json["score"].toDouble(),
        diseaseid: json["diseaseid"],
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
        "disease_name": diseaseName,
        "disease_class": diseaseClass,
        "disease_class_name": diseaseClassName,
        "disease_type": diseaseType,
        "disease_semantic_type": diseaseSemanticType,
        "source": source,
        "el": el,
        "ei": ei == null ? null : ei,
        "year_initial": yearInitial == null ? null : yearInitial,
        "year_final": yearFinal == null ? null : yearFinal,
        "score": score,
        "diseaseid": diseaseid,
    };
}