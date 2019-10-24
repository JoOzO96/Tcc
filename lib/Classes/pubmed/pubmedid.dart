// // To parse this JSON data, do
// //
// //     final pubMedId = pubMedIdFromJson(jsonString);

// import 'dart:convert';

// PubMedId pubMedIdFromJson(String str) => PubMedId.fromJson(json.decode(str));

// class PubMedId {
//   PubmedArticleSet pubmedArticleSet;

//   PubMedId({
//     this.pubmedArticleSet,
//   });

//   factory PubMedId.fromJson(Map<String, dynamic> json) => PubMedId(
//         pubmedArticleSet: PubmedArticleSet.fromJson(json["PubmedArticleSet"]),
//       );
// }

// class PubmedArticleSet {
//   List<PubmedArticle> pubmedArticle;

//   PubmedArticleSet({
//     this.pubmedArticle,
//   });

//   factory PubmedArticleSet.fromJson(Map<String, dynamic> json) =>
//       PubmedArticleSet(
//           // pubmedArticle: PubmedArticle.fromJson(json["PubmedArticle"]),
//           pubmedArticle: List<PubmedArticle>.from(
//               json["PubmedArticle"].map((x) => PubmedArticle.fromJson(x))));
// }

// class PubmedArticle {
//   MedlineCitation medlineCitation;
//   PubmedData pubmedData;

//   PubmedArticle({
//     this.medlineCitation,
//     this.pubmedData,
//   });

//   // factory PubmedArticle.fromJson(Map<String, dynamic> json) => PubmedArticle(
//   //       medlineCitation: json["MedlineCitation"] == null ? null : MedlineCitation.fromJson(json["MedlineCitation"]),
//   //       pubmedData: json["PubmedData"] == null ? null : PubmedData.fromJson(json["PubmedData"]),
//   //     );
//   PubmedArticle.fromJson(Map<String, dynamic> json) {
//     if (json != null) {
//       medlineCitation = json["MedlineCitation"] == null
//           ? null
//           : MedlineCitation.fromJson(json["MedlineCitation"]);
//       pubmedData = json["PubmedData"] == null
//           ? null
//           : PubmedData.fromJson(json["PubmedData"]);
//     } else {
//       medlineCitation = null;
//       pubmedData = null;
//     }
//   }
// }

// class MedlineCitation {
//   String status;
//   String owner;
//   Pmid pmid;
//   DateRevised dateRevised;
//   Article article;
//   MedlineJournalInfo medlineJournalInfo;
//   CitationSubset citationSubset;
//   KeywordList keywordList;

//   MedlineCitation({
//     this.status,
//     this.owner,
//     this.pmid,
//     this.dateRevised,
//     this.article,
//     this.medlineJournalInfo,
//     this.citationSubset,
//     this.keywordList,
//   });

//   // factory MedlineCitation.fromJson(Map<String, dynamic> json) =>
//   //     MedlineCitation(
//   //       status: json["@Status"],
//   //       owner: json["@Owner"],
//   //       pmid: Pmid.fromJson(json["PMID"]),
//   //       dateRevised: json["PubDate"] != null
//   //           ? DateRevised.fromJson(json["DateRevised"])
//   //           : null,
//   //       article: Article.fromJson(json["Article"]),
//   //       medlineJournalInfo:
//   //           MedlineJournalInfo.fromJson(json["MedlineJournalInfo"]),
//   //       citationSubset: json["Identifier"] == null
//   //           ? null
//   //           : CitationSubset.fromJson(json["CitationSubset"]),
//   //       keywordList: json["KeywordList"] != null
//   //           ? KeywordList.fromJson(json["KeywordList"])
//   //           : null,
//   //     );
//   MedlineCitation.fromJson(Map<String, dynamic> json) {
//     if (json != null) {
//       status = json["@Status"];
//       owner = json["@Owner"];
//       pmid = Pmid.fromJson(json["PMID"]);
//       dateRevised = json["PubDate"] != null
//           ? DateRevised.fromJson(json["DateRevised"])
//           : null;
//       article = Article.fromJson(json["Article"]);
//       medlineJournalInfo =
//           MedlineJournalInfo.fromJson(json["MedlineJournalInfo"]);
//       citationSubset = json["Identifier"] == null
//           ? null
//           : CitationSubset.fromJson(json["CitationSubset"]);
//       keywordList = json["KeywordList"] != null
//           ? KeywordList.fromJson(json["KeywordList"])
//           : null;
//     } else {
//       status = null;
//       owner = null;
//       pmid = null;
//       dateRevised = null;
//       article = null;
//       medlineJournalInfo = null;
//       citationSubset = null;
//       keywordList = null;
//     }
//   }
// }

// class Article {
//   String pubModel;
//   Journal journal;
//   CitationSubset articleTitle;
//   AuthorList authorList;
//   CitationSubset language;
//   PublicationTypeList publicationTypeList;
//   DateRevised articleDate;

//   Article({
//     this.pubModel,
//     this.journal,
//     this.articleTitle,
//     this.authorList,
//     this.language,
//     this.publicationTypeList,
//     this.articleDate,
//   });

//   // factory Article.fromJson(Map<String, dynamic> json) => Article(
//   //       pubModel: json["@PubModel"],
//   //       journal: Journal.fromJson(json["Journal"]),
//   //       articleTitle: json["Identifier"] == null
//   //           ? null
//   //           : CitationSubset.fromJson(json["ArticleTitle"]),
//   //       authorList: AuthorList.fromJson(json["AuthorList"]),
//   //       language: json["Identifier"] == null
//   //           ? null
//   //           : CitationSubset.fromJson(json["Language"]),
//   //       publicationTypeList:
//   //           PublicationTypeList.fromJson(json["PublicationTypeList"]),
//   //       articleDate: json["ArticleDate"] != null
//   //           ? DateRevised.fromJson(json["ArticleDate"])
//   //           : null,
//   //     );

//   Article.fromJson(Map<String, dynamic> json) {
//     if (json != null) {
//       pubModel = json["@PubModel"];
//       journal = Journal.fromJson(json["Journal"]);
//       articleTitle = json["ArticleTitle"] == null
//           ? null
//           : CitationSubset.fromJson(json["ArticleTitle"]);
//       authorList = AuthorList.fromJson(json["AuthorList"]);
//       language = json["Language"] == null
//           ? null
//           : CitationSubset.fromJson(json["Language"]);
//       publicationTypeList =
//           PublicationTypeList.fromJson(json["PublicationTypeList"]);
//       articleDate = json["ArticleDate"] != null
//           ? DateRevised.fromJson(json["ArticleDate"])
//           : null;
//     } else {
//       pubModel = null;
//       journal = null;
//       articleTitle = null;
//       authorList = null;
//       language = null;
//       publicationTypeList = null;
//       articleDate = null;
//     }
//   }
// }

// class DateRevised {
//   String dateType;
//   CitationSubset year;
//   CitationSubset month;
//   CitationSubset day;

//   DateRevised({
//     this.dateType,
//     this.year,
//     this.month,
//     this.day,
//   });

//   factory DateRevised.fromJson(Map<String, dynamic> json) => DateRevised(
//         dateType: json["@DateType"] == null ? null : json["@DateType"],
//         year: json["Identifier"] == null
//             ? null
//             : CitationSubset.fromJson(json["Year"]),
//         month: json["Identifier"] == null
//             ? null
//             : CitationSubset.fromJson(json["Month"]),
//         day: json["Identifier"] == null
//             ? null
//             : CitationSubset.fromJson(json["Day"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "@DateType": dateType == null ? null : dateType,
//         "Year": year.toJson(),
//         "Month": month.toJson(),
//         "Day": day.toJson(),
//       };
// }

// class CitationSubset {
//   String empty;

//   CitationSubset({
//     this.empty,
//   });

//   // factory CitationSubset.fromJson(Map<String, dynamic> json) => CitationSubset(
//   //       empty: json["\u0024"],
//   //     );

//   CitationSubset.fromJson(Map<String, dynamic> json) {
//     if (json != null) {
//       empty = json["\u0024"];
//     } else {
//       empty = null;
//     }
//   }

//   Map<String, dynamic> toJson() => {
//         "\u0024": empty,
//       };
// }

// class AuthorList {
//   Yn completeYn;
//   List<Author> author;

//   AuthorList({
//     this.completeYn,
//     this.author,
//   });

//   // factory AuthorList.fromJson(Map<String, dynamic> json) => AuthorList(
//   //     completeYn: ynValues.map[json["@CompleteYN"]],
//   //     author: List<Author>.from(json["Author"].map((x) => Author.fromJson(x))),
//   // );
//   AuthorList.fromJson(Map<String, dynamic> json) {
//     if (json != null) {
//       String jsonString = json.toString();
//       completeYn = ynValues.map[json["@CompleteYN"]];
//       if (json["Author"].toString().startsWith("[")) {
//         author =
//             List<Author>.from(json["Author"].map((x) => Author.fromJson(x)));
//       } else {
//         author = new List();
//         author.add(Author.fromJson(json["Author"]));
//       }
//     } else {
//       author = new List();
//       completeYn = null;
//     }
//   }
//   Map<String, dynamic> toJson() => {
//         "@CompleteYN": ynValues.reverse[completeYn],
//         "Author": List<dynamic>.from(author.map((x) => x.toJson())),
//       };
// }

// class Author {
//   Yn validYn;
//   CitationSubset lastName;
//   CitationSubset foreName;
//   CitationSubset initials;
//   Identifier identifier;
//   dynamic affiliationInfo;

//   Author({
//     this.validYn,
//     this.lastName,
//     this.foreName,
//     this.initials,
//     this.identifier,
//     this.affiliationInfo,
//   });

//   factory Author.fromJson(Map<String, dynamic> json) => Author(
//         validYn: ynValues.map[json["@ValidYN"]],
//         lastName: json["Identifier"] == null
//             ? null
//             : CitationSubset.fromJson(json["LastName"]),
//         foreName: json["Identifier"] == null
//             ? null
//             : CitationSubset.fromJson(json["ForeName"]),
//         initials: json["Identifier"] == null
//             ? null
//             : CitationSubset.fromJson(json["Initials"]),
//         identifier: json["Identifier"] == null
//             ? null
//             : Identifier.fromJson(json["Identifier"]),
//         affiliationInfo: json["AffiliationInfo"],
//       );

//   Map<String, dynamic> toJson() => {
//         "@ValidYN": ynValues.reverse[validYn],
//         "LastName": lastName.toJson(),
//         "ForeName": foreName.toJson(),
//         "Initials": initials.toJson(),
//         "Identifier": identifier == null ? null : identifier.toJson(),
//         "AffiliationInfo": affiliationInfo,
//       };
// }

// class AffiliationInfoElement {
//   CitationSubset affiliation;

//   AffiliationInfoElement({
//     this.affiliation,
//   });

//   factory AffiliationInfoElement.fromJson(Map<String, dynamic> json) =>
//       AffiliationInfoElement(
//         affiliation: json["Identifier"] == null
//             ? null
//             : CitationSubset.fromJson(json["Affiliation"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "Affiliation": affiliation.toJson(),
//       };
// }

// class Identifier {
//   String source;
//   String empty;

//   Identifier({
//     this.source,
//     this.empty,
//   });

//   factory Identifier.fromJson(Map<String, dynamic> json) => Identifier(
//         source: json["@Source"],
//         empty: json["\u0024"],
//       );

//   Map<String, dynamic> toJson() => {
//         "@Source": source,
//         "\u0024": empty,
//       };
// }

// enum Yn { Y }

// final ynValues = EnumValues({"Y": Yn.Y});

// class ELocationId {
//   String eIdType;
//   Yn validYn;
//   String empty;

//   ELocationId({
//     this.eIdType,
//     this.validYn,
//     this.empty,
//   });

//   factory ELocationId.fromJson(Map<String, dynamic> json) => ELocationId(
//         eIdType: json["@EIdType"],
//         validYn: ynValues.map[json["@ValidYN"]],
//         empty: json["\u0024"],
//       );

//   Map<String, dynamic> toJson() => {
//         "@EIdType": eIdType,
//         "@ValidYN": ynValues.reverse[validYn],
//         "\u0024": empty,
//       };
// }

// class Journal {
//   ISSN iSSN;
//   JournalIssue journalIssue;
//   String title;
//   String iSOAbbreviation;

//   Journal({this.iSSN, this.journalIssue, this.title, this.iSOAbbreviation});

//   Journal.fromJson(Map<String, dynamic> json) {
//     iSSN = json['ISSN'] != null ? new ISSN.fromJson(json['ISSN']) : null;
//     journalIssue = json['JournalIssue'] != null
//         ? new JournalIssue.fromJson(json['JournalIssue'])
//         : null;
//     title = json['Title'];
//     iSOAbbreviation = json['ISOAbbreviation'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.iSSN != null) {
//       data['ISSN'] = this.iSSN.toJson();
//     }
//     if (this.journalIssue != null) {
//       data['JournalIssue'] = this.journalIssue.toJson();
//     }
//     data['Title'] = this.title;
//     data['ISOAbbreviation'] = this.iSOAbbreviation;
//     return data;
//   }
// }

// class ISSN {
//   String sIssnType;
//   String sText;

//   ISSN({this.sIssnType, this.sText});

//   ISSN.fromJson(Map<String, dynamic> json) {
//     sIssnType = json['_IssnType'];
//     sText = json[String.fromCharCode(36) + 't'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_IssnType'] = this.sIssnType;
//     data[String.fromCharCode(36) + 't'] = this.sText;
//     return data;
//   }
// }

// class JournalIssue {
//   PubDate pubDate;
//   String sCitedMedium;

//   JournalIssue({this.pubDate, this.sCitedMedium});

//   JournalIssue.fromJson(Map<String, dynamic> json) {
//     pubDate =
//         json['PubDate'] != null ? new PubDate.fromJson(json['PubDate']) : null;
//     sCitedMedium = json['_CitedMedium'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.pubDate != null) {
//       data['PubDate'] = this.pubDate.toJson();
//     }
//     data['_CitedMedium'] = this.sCitedMedium;
//     return data;
//   }
// }

// class PubDate {
//   String year;
//   String month;
//   String day;

//   PubDate({this.year, this.month, this.day});

//   PubDate.fromJson(Map<String, dynamic> json) {
//     year = json['Year'];
//     month = json['Month'];
//     day = json['Day'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Year'] = this.year;
//     data['Month'] = this.month;
//     data['Day'] = this.day;
//     return data;
//   }
// }

// class PublicationTypeList {
//   List<PublicationType> publicationType;

//   PublicationTypeList({
//     this.publicationType,
//   });

//   // factory PublicationTypeList.fromJson(Map<String, dynamic> json) =>
//   //     PublicationTypeList(
//   //       publicationType: PublicationType.fromJson(json["PublicationType"]),
//   //     );
//   PublicationTypeList.fromJson(Map<String, dynamic> json) {
//     if (json["PublicationType"].toString().startsWith("[")) {
//       publicationType = List<PublicationType>.from(
//           json["PublicationType"].map((x) => PublicationType.fromJson(x)));
//     } else {
//       publicationType = new List();
//       publicationType.add(PublicationType.fromJson(json["PublicationType"]));
//     }
//   }
// }

// class PublicationType {
//   String ui;
//   String empty;

//   PublicationType({
//     this.ui,
//     this.empty,
//   });

//   factory PublicationType.fromJson(Map<String, dynamic> json) =>
//       PublicationType(
//         ui: json["@UI"],
//         empty: json["\u0024"],
//       );

//   Map<String, dynamic> toJson() => {
//         "@UI": ui,
//         "\u0024": empty,
//       };
// }

// class KeywordList {
//   String owner;
//   List<Keyword> keyword;

//   KeywordList({
//     this.owner,
//     this.keyword,
//   });

//   // factory KeywordList.fromJson(Map<String, dynamic> json) => KeywordList(
//   //       owner: json["@Owner"],
//   //       keyword:
//   //           List<Keyword>.from(json["Keyword"].map((x) => Keyword.fromJson(x))),
//   //     );

//   KeywordList.fromJson(Map<String, dynamic> json) {
//     if (json != null) {
//       if (json["Keyword"].toString().startsWith("[")) {
//         keyword =
//             List<Keyword>.from(json["Keyword"].map((x) => Keyword.fromJson(x)));
//       } else {
//         keyword = new List();
//         keyword.add(Keyword.fromJson(json["Keyword"]));
//       }
//     }
//   }

//   Map<String, dynamic> toJson() => {
//         "@Owner": owner,
//         "Keyword": List<dynamic>.from(keyword.map((x) => x.toJson())),
//       };
// }

// class Keyword {
//   String majorTopicYn;
//   String empty;

//   Keyword({
//     this.majorTopicYn,
//     this.empty,
//   });

//   factory Keyword.fromJson(Map<String, dynamic> json) => Keyword(
//         majorTopicYn: json["@MajorTopicYN"],
//         empty: json["\u0024"],
//       );

//   Map<String, dynamic> toJson() => {
//         "@MajorTopicYN": majorTopicYn,
//         "\u0024": empty,
//       };
// }

// class MedlineJournalInfo {
//   CitationSubset country;
//   CitationSubset medlineTa;
//   CitationSubset nlmUniqueId;
//   CitationSubset issnLinking;

//   MedlineJournalInfo({
//     this.country,
//     this.medlineTa,
//     this.nlmUniqueId,
//     this.issnLinking,
//   });

//   factory MedlineJournalInfo.fromJson(Map<String, dynamic> json) =>
//       MedlineJournalInfo(
//         country: json["Identifier"] == null
//             ? null
//             : CitationSubset.fromJson(json["Country"]),
//         medlineTa: json["Identifier"] == null
//             ? null
//             : CitationSubset.fromJson(json["MedlineTA"]),
//         nlmUniqueId: json["Identifier"] == null
//             ? null
//             : CitationSubset.fromJson(json["NlmUniqueID"]),
//         issnLinking: json["Identifier"] == null
//             ? null
//             : CitationSubset.fromJson(json["ISSNLinking"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "Country": country.toJson(),
//         "MedlineTA": medlineTa.toJson(),
//         "NlmUniqueID": nlmUniqueId.toJson(),
//         "ISSNLinking": issnLinking.toJson(),
//       };
// }

// class Pmid {
//   String version;
//   String empty;

//   Pmid({
//     this.version,
//     this.empty,
//   });

//   factory Pmid.fromJson(Map<String, dynamic> json) => Pmid(
//         version: json["@Version"],
//         empty: json["\u0024"],
//       );

//   Map<String, dynamic> toJson() => {
//         "@Version": version,
//         "\u0024": empty,
//       };
// }

// class PubmedData {
//   History history;
//   CitationSubset publicationStatus;
//   ArticleIdList articleIdList;

//   PubmedData({
//     this.history,
//     this.publicationStatus,
//     this.articleIdList,
//   });

//   factory PubmedData.fromJson(Map<String, dynamic> json) => PubmedData(
//         history: History.fromJson(json["History"]),
//         publicationStatus: json["Identifier"] == null
//             ? null
//             : CitationSubset.fromJson(json["PublicationStatus"]),
//         articleIdList: json["ArticleIdList"] == null
//             ? null
//             : ArticleIdList.fromJson(json["ArticleIdList"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "History": history.toJson(),
//         "PublicationStatus": publicationStatus.toJson(),
//         "ArticleIdList": articleIdList.toJson(),
//       };
// }

// class ArticleIdList {
//   List<ArticleId> articleId;

//   ArticleIdList({
//     this.articleId,
//   });

//   // factory ArticleIdList.fromJson(Map<String, dynamic> json) => ArticleIdList(
//   //       articleId: List<ArticleId>.from(
//   //           json["ArticleId"].map((x) => ArticleId.fromJson(x))),
//   //     );
//   ArticleIdList.fromJson(Map<String, dynamic> json) {
//     if (json != null) {
//       if (json["ArticleId"].toString().startsWith("[")) {
//         articleId = List<ArticleId>.from(
//             json["ArticleId"].map((x) => ArticleId.fromJson(x)));
//       } else {
//         articleId = new List();
//         articleId.add(ArticleId.fromJson(json["articleId"]));
//       }
//     }
//   }

//   Map<String, dynamic> toJson() => {
//         "ArticleId": List<dynamic>.from(articleId.map((x) => x.toJson())),
//       };
// }

// class ArticleId {
//   String idType;
//   String empty;

//   ArticleId({
//     this.idType,
//     this.empty,
//   });

//   // factory ArticleId.fromJson(Map<String, dynamic> json) => ArticleId(
//   //       idType: json["@IdType"],
//   //       empty: json["\u0024"],
//   //     );
//   ArticleId.fromJson(Map<String, dynamic> json) {
//     if (json != null) {
//       idType = json["idType"];
//       empty = json["empty"];
//     } else {
//       idType = null;
//       empty = null;
//     }
//   }

//   Map<String, dynamic> toJson() => {
//         "@IdType": idType,
//         "\u0024": empty,
//       };
// }

// class History {
//   List<PubMedPubDate> pubMedPubDate;

//   History({
//     this.pubMedPubDate,
//   });

//   factory History.fromJson(Map<String, dynamic> json) => History(
//         pubMedPubDate: List<PubMedPubDate>.from(
//             json["PubMedPubDate"].map((x) => PubMedPubDate.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "PubMedPubDate":
//             List<dynamic>.from(pubMedPubDate.map((x) => x.toJson())),
//       };
// }

// class PubMedPubDate {
//   String pubStatus;
//   CitationSubset year;
//   CitationSubset month;
//   CitationSubset day;
//   CitationSubset hour;
//   CitationSubset minute;

//   PubMedPubDate({
//     this.pubStatus,
//     this.year,
//     this.month,
//     this.day,
//     this.hour,
//     this.minute,
//   });

//   factory PubMedPubDate.fromJson(Map<String, dynamic> json) => PubMedPubDate(
//         pubStatus: json["@PubStatus"],
//         year: json["Identifier"] == null
//             ? null
//             : CitationSubset.fromJson(json["Year"]),
//         month: json["Identifier"] == null
//             ? null
//             : CitationSubset.fromJson(json["Month"]),
//         day: json["Identifier"] == null
//             ? null
//             : CitationSubset.fromJson(json["Day"]),
//         hour: json["Hour"] == null
//             ? null
//             : json["Identifier"] == null
//                 ? null
//                 : CitationSubset.fromJson(json["Hour"]),
//         minute: json["Minute"] == null
//             ? null
//             : json["Identifier"] == null
//                 ? null
//                 : CitationSubset.fromJson(json["Minute"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "@PubStatus": pubStatus,
//         "Year": year.toJson(),
//         "Month": month.toJson(),
//         "Day": day.toJson(),
//         "Hour": hour == null ? null : hour.toJson(),
//         "Minute": minute == null ? null : minute.toJson(),
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }



class PubMedId {
  PubmedArticleSet pubmedArticleSet;

  PubMedId({this.pubmedArticleSet});

  PubMedId.fromJson(Map<String, dynamic> json) {
    pubmedArticleSet = json['PubmedArticleSet'] != null
        ? new PubmedArticleSet.fromJson(json['PubmedArticleSet'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pubmedArticleSet != null) {
      data['PubmedArticleSet'] = this.pubmedArticleSet.toJson();
    }
    return data;
  }
}

class PubmedArticleSet {
  List<PubmedArticle> pubmedArticle;

  PubmedArticleSet({this.pubmedArticle});

  PubmedArticleSet.fromJson(Map<String, dynamic> json) {
    if (json['PubmedArticle'] != null) {
      pubmedArticle = new List<PubmedArticle>();
      json['PubmedArticle'].forEach((v) {
        pubmedArticle.add(new PubmedArticle.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pubmedArticle != null) {
      data['PubmedArticle'] =
          this.pubmedArticle.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PubmedArticle {
  MedlineCitation medlineCitation;
  PubmedData pubmedData;

  PubmedArticle({this.medlineCitation, this.pubmedData});

  PubmedArticle.fromJson(Map<String, dynamic> json) {
    medlineCitation = json['MedlineCitation'] != null
        ? new MedlineCitation.fromJson(json['MedlineCitation'])
        : null;
    pubmedData = json['PubmedData'] != null
        ? new PubmedData.fromJson(json['PubmedData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.medlineCitation != null) {
      data['MedlineCitation'] = this.medlineCitation.toJson();
    }
    if (this.pubmedData != null) {
      data['PubmedData'] = this.pubmedData.toJson();
    }
    return data;
  }
}

class MedlineCitation {
  PMID pMID;
  DateRevised dateRevised;
  Article article;
  MedlineJournalInfo medlineJournalInfo;
  List<CitationSubset> citationSubset;
  Status sStatus;
  Owner sOwner;
  KeywordList keywordList;
  CoiStatement coiStatement;
  DateCompleted dateCompleted;
  ChemicalList chemicalList;
  MeshHeadingList meshHeadingList;
  IndexingMethod sIndexingMethod;
  OtherAbstract otherAbstract;
  CommentsCorrectionsList commentsCorrectionsList;

  MedlineCitation(
      {this.pMID,
      this.dateRevised,
      this.article,
      this.medlineJournalInfo,
      this.citationSubset,
      this.sStatus,
      this.sOwner,
      this.keywordList,
      this.coiStatement,
      this.dateCompleted,
      this.chemicalList,
      this.meshHeadingList,
      this.sIndexingMethod,
      this.otherAbstract,
      this.commentsCorrectionsList});

  MedlineCitation.fromJson(Map<String, dynamic> json) {
    pMID = json['PMID'] != null ? new PMID.fromJson(json['PMID']) : null;
    dateRevised = json['DateRevised'] != null
        ? new DateRevised.fromJson(json['DateRevised'])
        : new DateRevised();
    article =
        json['Article'] != null ? new Article.fromJson(json['Article']) : null;
    medlineJournalInfo = json['MedlineJournalInfo'] != null
        ? new MedlineJournalInfo.fromJson(json['MedlineJournalInfo'])
        : null;
    citationSubset = new List();
    if (json['CitationSubset'] != null) {
      if (json['CitationSubset'].toString().startsWith("[")) {
        json['CitationSubset'].forEach((v) {
          citationSubset.add(new CitationSubset.fromJson(v));
        });
      } else {
        citationSubset.add(new CitationSubset.fromJson(json['CitationSubset']));
      }
    }

    sStatus =
        json['_Status'] != null ? new Status.fromJson(json['_Status']) : null;
    sOwner = json['_Owner'] != null ? new Owner.fromJson(json['_Owner']) : null;
    keywordList = json['KeywordList'] != null
        ? new KeywordList.fromJson(json['KeywordList'])
        : null;
    coiStatement = json['CoiStatement'] != null
        ? new CoiStatement.fromJson(json['CoiStatement'])
        : null;
    dateCompleted = json['DateCompleted'] != null
        ? new DateCompleted.fromJson(json['DateCompleted'])
        : null;
    chemicalList = json['ChemicalList'] != null
        ? new ChemicalList.fromJson(json['ChemicalList'])
        : null;
    meshHeadingList = json['MeshHeadingList'] != null
        ? new MeshHeadingList.fromJson(json['MeshHeadingList'])
        : null;
    sIndexingMethod = json['_IndexingMethod'] != null
        ? new IndexingMethod.fromJson(json['_IndexingMethod'])
        : null;
    otherAbstract = json['OtherAbstract'] != null
        ? new OtherAbstract.fromJson(json['OtherAbstract'])
        : null;
    commentsCorrectionsList = json['CommentsCorrectionsList'] != null
        ? new CommentsCorrectionsList.fromJson(json['CommentsCorrectionsList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pMID != null) {
      data['PMID'] = this.pMID.toJson();
    }
    if (this.dateRevised != null) {
      data['DateRevised'] = this.dateRevised.toJson();
    }
    if (this.article != null) {
      data['Article'] = this.article.toJson();
    }
    if (this.medlineJournalInfo != null) {
      data['MedlineJournalInfo'] = this.medlineJournalInfo.toJson();
    }
    data['CitationSubset'] = this.citationSubset;
    data['_Status'] = this.sStatus;
    data['_Owner'] = this.sOwner;
    if (this.keywordList != null) {
      data['KeywordList'] = this.keywordList.toJson();
    }
    data['CoiStatement'] = this.coiStatement;
    if (this.dateCompleted != null) {
      data['DateCompleted'] = this.dateCompleted.toJson();
    }
    if (this.chemicalList != null) {
      data['ChemicalList'] = this.chemicalList.toJson();
    }
    if (this.meshHeadingList != null) {
      data['MeshHeadingList'] = this.meshHeadingList.toJson();
    }
    data['_IndexingMethod'] = this.sIndexingMethod;
    if (this.otherAbstract != null) {
      data['OtherAbstract'] = this.otherAbstract.toJson();
    }
    if (this.commentsCorrectionsList != null) {
      data['CommentsCorrectionsList'] = this.commentsCorrectionsList.toJson();
    }
    return data;
  }
}

class IndexingMethod {
  String t;

  IndexingMethod({this.t});

  IndexingMethod.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class CoiStatement {
  String t;

  CoiStatement({this.t});

  CoiStatement.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class Owner {
  String t;

  Owner({this.t});

  Owner.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class Status {
  String t;

  Status({this.t});

  Status.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class CitationSubset {
  String t;

  CitationSubset({this.t});

  CitationSubset.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class DateCompleted {
  Year year;
  Month month;
  Day day;

  DateCompleted({this.year, this.month, this.day});

  DateCompleted.fromJson(Map<String, dynamic> json) {
    year = json['Year'] != null ? new Year.fromJson(json['Year']) : null;
    month = json['Month'] != null ? new Month.fromJson(json['Month']) : null;
    day = json['Day'] != null ? new Day.fromJson(json['Day']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Year'] = this.year;
    data['Month'] = this.month;
    data['Day'] = this.day;
    return data;
  }
}

class PMID {
  String sVersion;
  String sText;

  PMID({this.sVersion, this.sText});

  PMID.fromJson(Map<String, dynamic> json) {
    sVersion = json['_Version'];
    sText = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_Version'] = this.sVersion;
    data[String.fromCharCode(36) + 't'] = this.sText;
    return data;
  }
}

class DateRevised {
  Year year;
  Month month;
  Day day;

  DateRevised({this.year, this.month, this.day});

  DateRevised.fromJson(Map<String, dynamic> json) {
    year = json['Year'] != null ? new Year.fromJson(json['Year']) : new Year();
    month = json['Month'] != null ? new Month.fromJson(json['Month']) : null;
    day = json['Day'] != null ? new Day.fromJson(json['Day']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Year'] = this.year;
    data['Month'] = this.month;
    data['Day'] = this.day;
    return data;
  }
}

class Year {
  String t;

  Year({this.t});

  Year.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'] != null ? json[String.fromCharCode(36) + 't'] : "No date" ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class Title1 {
  String t;

  Title1({this.t});

  Title1.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class Language {
  String t;

  Language({this.t});

  Language.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class AbstractText {
  String t;

  AbstractText({this.t});

  AbstractText.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class CopyrightInformation {
  String t;

  CopyrightInformation({this.t});

  CopyrightInformation.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class LastName {
  String t;

  LastName({this.t});

  LastName.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class ISOAbbreviation {
  String t;

  ISOAbbreviation({this.t});

  ISOAbbreviation.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class Month {
  String t;

  Month({this.t});

  Month.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class Day {
  String t;

  Day({this.t});

  Day.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class Article {
  Journal journal;
  Title1 articleTitle;
  List<ELocationID> eLocationID;
  Abstract1 abstract1;
  AuthorList authorList;
  Language language;
  PublicationTypeList publicationTypeList;
  ArticleDate articleDate;
  String sPubModel;
  Pagination pagination;
  DataBankList dataBankList;
  GrantList grantList;
  VernacularTitle vernacularTitle;

  Article(
      {this.journal,
      this.articleTitle,
      this.eLocationID,
      this.abstract1,
      this.authorList,
      this.language,
      this.publicationTypeList,
      this.articleDate,
      this.sPubModel,
      this.pagination,
      this.dataBankList,
      this.grantList,
      this.vernacularTitle});

  Article.fromJson(Map<String, dynamic> json) {
    journal =
        json['Journal'] != null ? new Journal.fromJson(json['Journal']) : null;
    articleTitle = json['ArticleTitle'] != null
        ? new Title1.fromJson(json['ArticleTitle'])
        : null;
    eLocationID = new List();
    if (json['ELocationID'].toString().startsWith("[")) {
      json['ELocationID'].forEach((v) {
        eLocationID.add(new ELocationID.fromJson(v));
      });
    } else {
      eLocationID.add(new ELocationID.fromJson(json['ELocationID']));
    }

    abstract1 = json['Abstract'] != null
        ? new Abstract1.fromJson(json['Abstract'])
        : null;
    authorList = json['AuthorList'] != null
        ? new AuthorList.fromJson(json['AuthorList'])
        : null;
    language = json['Language'] != null
        ? new Language.fromJson(json['Language'])
        : null;
    publicationTypeList = json['PublicationTypeList'] != null
        ? new PublicationTypeList.fromJson(json['PublicationTypeList'])
        : null;
    articleDate = json['ArticleDate'] != null
        ? new ArticleDate.fromJson(json['ArticleDate'])
        : null;
    sPubModel = json['_PubModel'];
    pagination = json['Pagination'] != null
        ? new Pagination.fromJson(json['Pagination'])
        : null;
    dataBankList = json['DataBankList'] != null
        ? new DataBankList.fromJson(json['DataBankList'])
        : null;
    grantList = json['GrantList'] != null
        ? new GrantList.fromJson(json['GrantList'])
        : null;
    vernacularTitle = json['VernacularTitle'] != null
        ? new VernacularTitle.fromJson(json['VernacularTitle'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.journal != null) {
      data['Journal'] = this.journal.toJson();
    }
    data['ArticleTitle'] = this.articleTitle;

    if (this.abstract1 != null) {
      data['Abstract'] = this.abstract1.toJson();
    }
    if (this.authorList != null) {
      data['AuthorList'] = this.authorList.toJson();
    }
    data['Language'] = this.language;
    if (this.publicationTypeList != null) {
      data['PublicationTypeList'] = this.publicationTypeList.toJson();
    }
    if (this.articleDate != null) {
      data['ArticleDate'] = this.articleDate.toJson();
    }
    data['_PubModel'] = this.sPubModel;
    if (this.pagination != null) {
      data['Pagination'] = this.pagination.toJson();
    }
    if (this.dataBankList != null) {
      data['DataBankList'] = this.dataBankList.toJson();
    }

    data['VernacularTitle'] = this.vernacularTitle;
    return data;
  }
}

class VernacularTitle {
  String t;

  VernacularTitle({this.t});

  VernacularTitle.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class Journal {
  ISSN iSSN;
  JournalIssue journalIssue;
  Title1 title;
  ISOAbbreviation iSOAbbreviation;

  Journal({this.iSSN, this.journalIssue, this.title, this.iSOAbbreviation});

  Journal.fromJson(Map<String, dynamic> json) {
    iSSN = json['ISSN'] != null ? new ISSN.fromJson(json['ISSN']) : null;
    journalIssue = json['JournalIssue'] != null
        ? new JournalIssue.fromJson(json['JournalIssue'])
        : null;
    title = json['Title'] != null ? new Title1.fromJson(json['Title']) : null;
    iSOAbbreviation = json['ISOAbbreviation'] != null
        ? new ISOAbbreviation.fromJson(json['ISOAbbreviation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iSSN != null) {
      data['ISSN'] = this.iSSN.toJson();
    }
    if (this.journalIssue != null) {
      data['JournalIssue'] = this.journalIssue.toJson();
    }
    data['Title'] = this.title;
    data['ISOAbbreviation'] = this.iSOAbbreviation;
    return data;
  }
}

class ISSN {
  String sIssnType;
  String sText;

  ISSN({this.sIssnType, this.sText});

  ISSN.fromJson(Map<String, dynamic> json) {
    sIssnType = json['_IssnType'];
    sText = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_IssnType'] = this.sIssnType;
    data[String.fromCharCode(36) + 't'] = this.sText;
    return data;
  }
}

class JournalIssue {
  PubDate pubDate;
  SCitedMedium sCitedMedium;
  Volume volume;
  Issue issue;

  JournalIssue({this.pubDate, this.sCitedMedium, this.volume, this.issue});

  JournalIssue.fromJson(Map<String, dynamic> json) {
    pubDate =
        json['PubDate'] != null ? new PubDate.fromJson(json['PubDate']) : null;
    sCitedMedium = json['_CitedMedium'];
    sCitedMedium = json['_CitedMedium'] != null
        ? new SCitedMedium.fromJson(json['_CitedMedium'])
        : null;
    volume =
        json['Volume'] != null ? new Volume.fromJson(json['Volume']) : null;
    issue = json['Issue'] != null ? new Issue.fromJson(json['Issue']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pubDate != null) {
      data['PubDate'] = this.pubDate.toJson();
    }
    data['_CitedMedium'] = this.sCitedMedium;
    data['Volume'] = this.volume;
    data['Issue'] = this.issue;
    return data;
  }
}

class Issue {
  String t;

  Issue({this.t});

  Issue.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class Volume {
  String t;

  Volume({this.t});

  Volume.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class SCitedMedium {
  String t;

  SCitedMedium({this.t});

  SCitedMedium.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class PubDate {
  Year year;
  Month month;
  Day day;

  PubDate({this.year, this.month, this.day});

  PubDate.fromJson(Map<String, dynamic> json) {
    year = json['Year'] != null ? new Year.fromJson(json['Year']) : null;
    month = json['Month'] != null ? new Month.fromJson(json['Month']) : null;
    day = json['Day'] != null ? new Day.fromJson(json['Day']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Year'] = this.year;
    data['Month'] = this.month;
    data['Day'] = this.day;
    return data;
  }
}

class ELocationID {
  String sEIdType;
  String sValidYN;
  String sText;

  ELocationID({this.sEIdType, this.sValidYN, this.sText});

  ELocationID.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      sEIdType = json['_EIdType'] != null ? json['_EIdType'] : null;
      sValidYN = json['_ValidYN'] != null ? json['_ValidYN'] : null;
      sText = json[String.fromCharCode(36) + 't'] != null ? json[String.fromCharCode(36) + 't'] : null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_EIdType'] = this.sEIdType;
    data['_ValidYN'] = this.sValidYN;
    data[String.fromCharCode(36) + 't'] = this.sText;
    return data;
  }
}

class Abstract1 {
  List<AbstractText> abstractText;
  CopyrightInformation copyrightInformation;

  Abstract1({this.abstractText, this.copyrightInformation});

  Abstract1.fromJson(Map<String, dynamic> json) {
    abstractText = new List();
    if (json['AbstractText'].toString().startsWith("[")) {
      json['AbstractText'].forEach((v) {
        abstractText.add(new AbstractText.fromJson(v));
      });
    } else {
      abstractText.add(new AbstractText.fromJson(json['AbstractText']));
    }
    copyrightInformation = json['CopyrightInformation'] != null
        ? new CopyrightInformation.fromJson(json['CopyrightInformation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AbstractText'] = this.abstractText;
    data['CopyrightInformation'] = this.copyrightInformation;
    return data;
  }
}

class AuthorList {
  List<Author> author;
  String sCompleteYN;

  AuthorList({this.author, this.sCompleteYN});

  AuthorList.fromJson(Map<String, dynamic> json) {
    if (json['Author'] != null) {
      author = new List<Author>();
      if (json['Author'].toString().startsWith("[")) {
        json['Author'].forEach((v) {
          author.add(new Author.fromJson(v));
        });
      } else {
        author.add(new Author.fromJson(json['Author']));
      }
    }
    sCompleteYN = json['_CompleteYN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.author != null) {
      data['Author'] = this.author.map((v) => v.toJson()).toList();
    }
    data['_CompleteYN'] = this.sCompleteYN;
    return data;
  }
}

class Author {
  LastName lastName;
  ForeName foreName;
  Initials initials;
  Identifier identifier;
  List<AffiliationInfo> affiliationInfo;
  String sValidYN;
  String sEqualContrib;

  Author(
      {this.lastName,
      this.foreName,
      this.initials,
      this.identifier,
      this.affiliationInfo,
      this.sValidYN,
      this.sEqualContrib});

  Author.fromJson(Map<String, dynamic> json) {
    lastName = json['LastName'] != null
        ? new LastName.fromJson(json['LastName'])
        : null;
    foreName = json['ForeName'] != null
        ? new ForeName.fromJson(json['ForeName'])
        : null;
    initials = json['Initials'] != null
        ? new Initials.fromJson(json['Initials'])
        : null;
    identifier = json['Identifier'] != null
        ? new Identifier.fromJson(json['Identifier'])
        : null;

    try {
      if (json['AffiliationInfo'] != null) {
        if (json['AffiliationInfo'].toString().startsWith("[")) {
          affiliationInfo = json['AffiliationInfo'] != null
              ? json['AffiliationInfo'].forEach((v) {
                  affiliationInfo.add(new AffiliationInfo.fromJson(v));
                })
              : null;
        } else {
          affiliationInfo = new List();
          affiliationInfo
              .add(new AffiliationInfo.fromJson(json['AffiliationInfo']));
        }
      }
    } on Error catch (e) {}

    sValidYN = json['_ValidYN'];
    sEqualContrib = json['_EqualContrib'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LastName'] = this.lastName;
    data['ForeName'] = this.foreName;
    data['Initials'] = this.initials;
    if (this.identifier != null) {
      data['Identifier'] = this.identifier.toJson();
    }

    data['_ValidYN'] = this.sValidYN;
    data['_EqualContrib'] = this.sEqualContrib;
    return data;
  }
}

class ForeName {
  String t;

  ForeName({this.t});

  ForeName.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class Initials {
  String t;

  Initials({this.t});

  Initials.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class Identifier {
  String sSource;
  String sText;

  Identifier({this.sSource, this.sText});

  Identifier.fromJson(Map<String, dynamic> json) {
    sSource = json['_Source'];
    sText = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_Source'] = this.sSource;
    data[String.fromCharCode(36) + 't'] = this.sText;
    return data;
  }
}

class AffiliationInfo {
  Affiliation affiliation;
  Identifier identifier;

  AffiliationInfo({this.affiliation, this.identifier});

  AffiliationInfo.fromJson(Map<String, dynamic> json) {
    affiliation = json['Affiliation'] != null
        ? new Affiliation.fromJson(json['Affiliation'])
        : null;
    identifier = json['Identifier'] != null
        ? new Identifier.fromJson(json['Identifier'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Affiliation'] = this.affiliation;
    if (this.identifier != null) {
      data['Identifier'] = this.identifier.toJson();
    }
    return data;
  }
}

class Affiliation {
  String t;

  Affiliation({this.t});

  Affiliation.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class PublicationTypeList {
  List<PublicationType> publicationType;

  PublicationTypeList({this.publicationType});

  PublicationTypeList.fromJson(Map<String, dynamic> json) {
    publicationType = new List<PublicationType>();
    if (json['PublicationType'] != null) {
      if (json['PublicationType'].toString().startsWith("[")) {
        json['PublicationType'].forEach((v) {
          publicationType.add(new PublicationType.fromJson(v));
        });
      } else {
        publicationType
            .add(new PublicationType.fromJson(json['PublicationType']));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.publicationType != null) {
      data['PublicationType'] =
          this.publicationType.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PublicationType {
  String sUI;
  String sText;

  PublicationType({this.sUI, this.sText});

  PublicationType.fromJson(Map<String, dynamic> json) {
    sUI = json['_UI'] != null ? json['_UI'] : null;
    sText = json[String.fromCharCode(36) + 't'] != null ? json[String.fromCharCode(36) + 't'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_UI'] = this.sUI;
    data[String.fromCharCode(36) + 't'] = this.sText;
    return data;
  }
}

class ArticleDate {
  Year year;
  Month month;
  Day day;
  String sDateType;

  ArticleDate({this.year, this.month, this.day, this.sDateType});

  ArticleDate.fromJson(Map<String, dynamic> json) {
    year = json['Year'] != null ? new Year.fromJson(json['Year']) : null;
    month = json['Month'] != null ? new Month.fromJson(json['Month']) : null;
    day = json['Day'] != null ? new Day.fromJson(json['Day']) : null;
    sDateType = json['_DateType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Year'] = this.year;
    data['Month'] = this.month;
    data['Day'] = this.day;
    data['_DateType'] = this.sDateType;
    return data;
  }
}

class Pagination {
  MedlinePgn medlinePgn;

  Pagination({this.medlinePgn});

  Pagination.fromJson(Map<String, dynamic> json) {
    medlinePgn = json['MedlinePgn'] != null
        ? new MedlinePgn.fromJson(json['MedlinePgn'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MedlinePgn'] = this.medlinePgn;
    return data;
  }
}

class MedlinePgn {
  String t;

  MedlinePgn({this.t});

  MedlinePgn.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class DataBankList {
  DataBank dataBank;
  String sCompleteYN;

  DataBankList({this.dataBank, this.sCompleteYN});

  DataBankList.fromJson(Map<String, dynamic> json) {
    dataBank = json['DataBank'] != null
        ? new DataBank.fromJson(json['DataBank'])
        : null;
    sCompleteYN = json['_CompleteYN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataBank != null) {
      data['DataBank'] = this.dataBank.toJson();
    }
    data['_CompleteYN'] = this.sCompleteYN;
    return data;
  }
}

class DataBank {
  DataBankName dataBankName;
  AccessionNumberList accessionNumberList;

  DataBank({this.dataBankName, this.accessionNumberList});

  DataBank.fromJson(Map<String, dynamic> json) {
    dataBankName = json['DataBankName'] != null
        ? new DataBankName.fromJson(json['DataBankName'])
        : null;
    accessionNumberList = json['AccessionNumberList'] != null
        ? new AccessionNumberList.fromJson(json['AccessionNumberList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DataBankName'] = this.dataBankName;
    if (this.accessionNumberList != null) {
      data['AccessionNumberList'] = this.accessionNumberList.toJson();
    }
    return data;
  }
}

class DataBankName {
  String t;

  DataBankName({this.t});

  DataBankName.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class AccessionNumberList {
  AccessionNumber accessionNumber;

  AccessionNumberList({this.accessionNumber});

  AccessionNumberList.fromJson(Map<String, dynamic> json) {
    accessionNumber = json['AccessionNumber'] != null
        ? new AccessionNumber.fromJson(json['AccessionNumber'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccessionNumber'] = this.accessionNumber;
    return data;
  }
}

class AccessionNumber {
  String t;

  AccessionNumber({this.t});

  AccessionNumber.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class GrantList {
  List<Grant> grant;
  String sCompleteYN;

  GrantList({this.grant, this.sCompleteYN});

  GrantList.fromJson(Map<String, dynamic> json) {
    grant = new List();
    if (json['Grant'].toString().startsWith("[")) {
      json['Grant'].forEach((v) {
        grant.add(new Grant.fromJson(v));
      });
    } else {
      grant.add(new Grant.fromJson(json['Grant']));
    }
    sCompleteYN = json['_CompleteYN'];
  }
}

class Grant {
  GrantID grantID;
  Agency agency;
  Country country;
  Acronym acronym;

  Grant({this.grantID, this.agency, this.country, this.acronym});

  Grant.fromJson(Map<String, dynamic> json) {
    grantID =
        json['GrantID'] != null ? new GrantID.fromJson(json['GrantID']) : null;
    agency =
        json['Agency'] != null ? new Agency.fromJson(json['Agency']) : null;
    country =
        json['Country'] != null ? new Country.fromJson(json['Country']) : null;
    acronym =
        json['Acronym'] != null ? new Acronym.fromJson(json['Acronym']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['GrantID'] = this.grantID;
    data['Agency'] = this.agency;
    data['Country'] = this.country;
    data['Acronym'] = this.acronym;
    return data;
  }
}

class Acronym {
  String t;

  Acronym({this.t});

  Acronym.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class Agency {
  String t;

  Agency({this.t});

  Agency.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class GrantID {
  String t;

  GrantID({this.t});

  GrantID.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class MedlineJournalInfo {
  Country country;
  MedlineTA medlineTA;
  NlmUniqueID nlmUniqueID;
  ISSNLinking iSSNLinking;

  MedlineJournalInfo(
      {this.country, this.medlineTA, this.nlmUniqueID, this.iSSNLinking});

  MedlineJournalInfo.fromJson(Map<String, dynamic> json) {
    country =
        json['Country'] != null ? new Country.fromJson(json['Country']) : null;
    medlineTA = json['MedlineTA'] != null
        ? new MedlineTA.fromJson(json['MedlineTA'])
        : null;
    nlmUniqueID = json['NlmUniqueID'] != null
        ? new NlmUniqueID.fromJson(json['NlmUniqueID'])
        : null;
    iSSNLinking = json['ISSNLinking'] != null
        ? new ISSNLinking.fromJson(json['ISSNLinking'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Country'] = this.country;
    data['MedlineTA'] = this.medlineTA;
    data['NlmUniqueID'] = this.nlmUniqueID;
    data['ISSNLinking'] = this.iSSNLinking;
    return data;
  }
}

class ISSNLinking {
  String t;

  ISSNLinking({this.t});

  ISSNLinking.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class NlmUniqueID {
  String t;

  NlmUniqueID({this.t});

  NlmUniqueID.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class MedlineTA {
  String t;

  MedlineTA({this.t});

  MedlineTA.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class Country {
  String t;

  Country({this.t});

  Country.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class KeywordList {
  List<Keyword> keyword;
  String sOwner;

  KeywordList({this.keyword, this.sOwner});

  KeywordList.fromJson(Map<String, dynamic> json) {
    if (json['Keyword'] != null) {
      keyword = new List<Keyword>();
      if (json['Keyword'].toString().startsWith("[")) {
        json['Keyword'].forEach((v) {
          keyword.add(new Keyword.fromJson(v));
        });
      } else {
        keyword.add(new Keyword.fromJson(json['Keyword']));
      }
    }
    sOwner = json['_Owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.keyword != null) {
      data['Keyword'] = this.keyword.map((v) => v.toJson()).toList();
    }
    data['_Owner'] = this.sOwner;
    return data;
  }
}

class Keyword {
  String sMajorTopicYN;
  String sText;

  Keyword({this.sMajorTopicYN, this.sText});

  Keyword.fromJson(Map<String, dynamic> json) {
    sMajorTopicYN = json['_MajorTopicYN'];
    sText = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_MajorTopicYN'] = this.sMajorTopicYN;
    data[String.fromCharCode(36) + 't'] = this.sText;
    return data;
  }
}

class ChemicalList {
  List<Chemical> chemical;

  ChemicalList({this.chemical});

  ChemicalList.fromJson(Map<String, dynamic> json) {
    if (json['Chemical'] != null) {
      chemical = new List<Chemical>();
      if (json['Chemical'].toString().startsWith("[")) {
        json['Chemical'].forEach((v) {
          chemical.add(new Chemical.fromJson(v));
        });
      } else {
        chemical.add(new Chemical.fromJson(json['Chemical']));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chemical != null) {
      data['Chemical'] = this.chemical.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chemical {
  RegistryNumber registryNumber;
  NameOfSubstance nameOfSubstance;

  Chemical({this.registryNumber, this.nameOfSubstance});

  Chemical.fromJson(Map<String, dynamic> json) {
    registryNumber = json['RegistryNumber'] != null
        ? new RegistryNumber.fromJson(json['RegistryNumber'])
        : null;
    nameOfSubstance = json['NameOfSubstance'] != null
        ? new NameOfSubstance.fromJson(json['NameOfSubstance'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RegistryNumber'] = this.registryNumber;
    if (this.nameOfSubstance != null) {
      data['NameOfSubstance'] = this.nameOfSubstance.toJson();
    }
    return data;
  }
}

class RegistryNumber {
  String t;

  RegistryNumber({this.t});

  RegistryNumber.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class NameOfSubstance {
  String sUI;
  String sText;

  NameOfSubstance({this.sUI, this.sText});

  NameOfSubstance.fromJson(Map<String, dynamic> json) {
    sUI = json['_UI'];
    sText = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_UI'] = this.sUI;
    data[String.fromCharCode(36) + 't'] = this.sText;
    return data;
  }
}

class MeshHeadingList {
  List<MeshHeading> meshHeading;

  MeshHeadingList({this.meshHeading});

  MeshHeadingList.fromJson(Map<String, dynamic> json) {
    if (json['MeshHeading'] != null) {
      meshHeading = new List<MeshHeading>();
      json['MeshHeading'].forEach((v) {
        meshHeading.add(new MeshHeading.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meshHeading != null) {
      data['MeshHeading'] = this.meshHeading.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MeshHeading {
  DescriptorName descriptorName;
  List<QualifierName> qualifierName;

  MeshHeading({this.descriptorName, this.qualifierName});

  MeshHeading.fromJson(Map<String, dynamic> json) {
    descriptorName = json['DescriptorName'] != null
        ? new DescriptorName.fromJson(json['DescriptorName'])
        : null;
    qualifierName = new List();
    if (json['QualifierName'] != null) {
      if (json['QualifierName'].toString().startsWith("[")) {
        json['QualifierName'].forEach((v) {
          qualifierName.add(new QualifierName.fromJson(v));
        });
      } else {
        qualifierName.add(new QualifierName.fromJson(json['QualifierName']));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.descriptorName != null) {
      data['DescriptorName'] = this.descriptorName.toJson();
    }

    return data;
  }
}

class DescriptorName {
  String sUI;
  String sMajorTopicYN;
  String sText;
  String sType;

  DescriptorName({this.sUI, this.sMajorTopicYN, this.sText, this.sType});

  DescriptorName.fromJson(Map<String, dynamic> json) {
    sUI = json['_UI'];
    sMajorTopicYN = json['_MajorTopicYN'];
    sText = json[String.fromCharCode(36) + 't'];
    sType = json['_Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_UI'] = this.sUI;
    data['_MajorTopicYN'] = this.sMajorTopicYN;
    data[String.fromCharCode(36) + 't'] = this.sText;
    data['_Type'] = this.sType;
    return data;
  }
}

class QualifierName {
  String sUI;
  String sMajorTopicYN;
  String sText;

  QualifierName({this.sUI, this.sMajorTopicYN, this.sText});

  QualifierName.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      sUI = json['_UI'] != null ? json['_UI'] : null;
      sMajorTopicYN =
          json['_MajorTopicYN'] != null ? json['_MajorTopicYN'] : null;
      sText = json[String.fromCharCode(36) + 't'] != null ? json[String.fromCharCode(36) + 't'] : null;
    } else {
      sUI = null;
      sMajorTopicYN = null;
      sText = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_UI'] = this.sUI;
    data['_MajorTopicYN'] = this.sMajorTopicYN;
    data[String.fromCharCode(36) + 't'] = this.sText;
    return data;
  }
}

class OtherAbstract {
  List<AbstractText> abstractText;
  Type1 sType;
  Language sLanguage;

  OtherAbstract({this.abstractText, this.sType, this.sLanguage});

  OtherAbstract.fromJson(Map<String, dynamic> json) {
    abstractText = new List();
    if (json['AbstractText'].toString().startsWith("[")){
      json['AbstractText'].forEach((v) {
        abstractText.add(new AbstractText.fromJson(v));
      });
    }else{
      abstractText.add(new AbstractText.fromJson(json['AbstractText']));
    }
    
    sType = json['_Type'] != null ? new Type1.fromJson(json['_Type']) : null;
    sLanguage = json['_Language'] != null
        ? new Language.fromJson(json['_Language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AbstractText'] = this.abstractText;
    data['_Type'] = this.sType;
    data['_Language'] = this.sLanguage;
    return data;
  }
}

class Type1 {
  String t;

  Type1({this.t});

  Type1.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class CommentsCorrectionsList {
  List<CommentsCorrections> commentsCorrections;

  CommentsCorrectionsList({this.commentsCorrections});

  CommentsCorrectionsList.fromJson(Map<String, dynamic> json) {
    commentsCorrections = new List();
    if (json['CommentsCorrections'].toString().startsWith("[")) {
      json['CommentsCorrections'].forEach((v) {
        commentsCorrections.add(new CommentsCorrections.fromJson(v));
      });
    } else {
      commentsCorrections
          .add(new CommentsCorrections.fromJson(json['CommentsCorrections']));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    return data;
  }
}

class CommentsCorrections {
  List<RefSource> refSource;
  PMID pMID;
  String sRefType;

  CommentsCorrections({this.refSource, this.pMID, this.sRefType});

  CommentsCorrections.fromJson(Map<String, dynamic> json) {
    refSource = new List();
    if (json['RefSource'].toString().startsWith("[")) {
      json['RefSource'].forEach((v) {
        refSource.add(RefSource.fromJson(json['RefSource']));
      });
    } else {
      refSource.add(RefSource.fromJson(json['RefSource']));
    }
    pMID = json['PMID'] != null ? new PMID.fromJson(json['PMID']) : null;
    sRefType = json['_RefType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RefSource'] = this.refSource;
    if (this.pMID != null) {
      data['PMID'] = this.pMID.toJson();
    }
    data['_RefType'] = this.sRefType;
    return data;
  }
}

class RefSource {
  String t;

  RefSource({this.t});

  RefSource.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class PubmedData {
  History history;
  PublicationStatus publicationStatus;
  ArticleIdList articleIdList;

  PubmedData({this.history, this.publicationStatus, this.articleIdList});

  PubmedData.fromJson(Map<String, dynamic> json) {
    history =
        json['History'] != null ? new History.fromJson(json['History']) : null;
    publicationStatus = json['PublicationStatus'] != null
        ? new PublicationStatus.fromJson(json['PublicationStatus'])
        : null;
    articleIdList = json['ArticleIdList'] != null
        ? new ArticleIdList.fromJson(json['ArticleIdList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.history != null) {
      data['History'] = this.history.toJson();
    }
    data['PublicationStatus'] = this.publicationStatus;
    if (this.articleIdList != null) {
      data['ArticleIdList'] = this.articleIdList.toJson();
    }
    return data;
  }
}

class PublicationStatus {
  String t;

  PublicationStatus({this.t});

  PublicationStatus.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class History {
  List<PubMedPubDate> pubMedPubDate;

  History({this.pubMedPubDate});

  History.fromJson(Map<String, dynamic> json) {
    if (json['PubMedPubDate'] != null) {
      pubMedPubDate = new List<PubMedPubDate>();
      json['PubMedPubDate'].forEach((v) {
        pubMedPubDate.add(new PubMedPubDate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pubMedPubDate != null) {
      data['PubMedPubDate'] =
          this.pubMedPubDate.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PubMedPubDate {
  Year year;
  Month month;
  Day day;
  String sPubStatus;
  Hour hour;
  Minute minute;

  PubMedPubDate(
      {this.year,
      this.month,
      this.day,
      this.sPubStatus,
      this.hour,
      this.minute});

  PubMedPubDate.fromJson(Map<String, dynamic> json) {
    year = json['Year'] != null ? new Year.fromJson(json['Year']) : null;
    month = json['Month'] != null ? new Month.fromJson(json['Month']) : null;
    day = json['Day'] != null ? new Day.fromJson(json['Day']) : null;
    sPubStatus = json['_PubStatus'];
    hour = json['Hour'] != null ? new Hour.fromJson(json['Hour']) : null;
    minute =
        json['Minute'] != null ? new Minute.fromJson(json['Minute']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Year'] = this.year;
    data['Month'] = this.month;
    data['Day'] = this.day;
    data['_PubStatus'] = this.sPubStatus;
    data['Hour'] = this.hour;
    data['Minute'] = this.minute;
    return data;
  }
}

class Hour {
  String t;

  Hour({this.t});

  Hour.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class Minute {
  String t;

  Minute({this.t});

  Minute.fromJson(Map<String, dynamic> json) {
    t = json[String.fromCharCode(36) + 't'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$t'] = this.t;
    return data;
  }
}

class ArticleIdList {
  List<ArticleId> articleId;

  ArticleIdList({this.articleId});

  ArticleIdList.fromJson(Map<String, dynamic> json) {
    if (json['ArticleId'] != null) {
      articleId = new List<ArticleId>();
      if (json['ArticleId'].toString().startsWith("[")) {
        json['ArticleId'].forEach((v) {
          articleId.add(new ArticleId.fromJson(v));
        });
      } else {
        articleId.add(new ArticleId.fromJson(json['ArticleId']));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.articleId != null) {
      data['ArticleId'] = this.articleId.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ArticleId {
  String sIdType;
  String sText;

  ArticleId({this.sIdType, this.sText});

  ArticleId.fromJson(Map<String, dynamic> json) {
    sIdType = json['IdType'] != null ? json['IdType'] : null;
    sText = json[String.fromCharCode(36) + 't'] != null ? json[String.fromCharCode(36) + 't'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_IdType'] = this.sIdType;
    data[String.fromCharCode(36) + 't'] = this.sText;
    return data;
  }
}
