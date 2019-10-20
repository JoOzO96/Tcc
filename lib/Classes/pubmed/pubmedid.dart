// To parse this JSON data, do
//
//     final pubMedId = pubMedIdFromJson(jsonString);

import 'dart:convert';

PubMedId pubMedIdFromJson(String str) => PubMedId.fromJson(json.decode(str));

class PubMedId {
  PubmedArticleSet pubmedArticleSet;

  PubMedId({
    this.pubmedArticleSet,
  });

  factory PubMedId.fromJson(Map<String, dynamic> json) => PubMedId(
        pubmedArticleSet: PubmedArticleSet.fromJson(json["PubmedArticleSet"]),
      );
}

class PubmedArticleSet {
  List<PubmedArticle> pubmedArticle;

  PubmedArticleSet({
    this.pubmedArticle,
  });

  factory PubmedArticleSet.fromJson(Map<String, dynamic> json) =>
      PubmedArticleSet(
          // pubmedArticle: PubmedArticle.fromJson(json["PubmedArticle"]),
          pubmedArticle: List<PubmedArticle>.from(
              json["PubmedArticle"].map((x) => PubmedArticle.fromJson(x))));
}

class PubmedArticle {
  MedlineCitation medlineCitation;
  PubmedData pubmedData;

  PubmedArticle({
    this.medlineCitation,
    this.pubmedData,
  });

  // factory PubmedArticle.fromJson(Map<String, dynamic> json) => PubmedArticle(
  //       medlineCitation: json["MedlineCitation"] == null ? null : MedlineCitation.fromJson(json["MedlineCitation"]),
  //       pubmedData: json["PubmedData"] == null ? null : PubmedData.fromJson(json["PubmedData"]),
  //     );
  PubmedArticle.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      medlineCitation = json["MedlineCitation"] == null
          ? null
          : MedlineCitation.fromJson(json["MedlineCitation"]);
      pubmedData = json["PubmedData"] == null
          ? null
          : PubmedData.fromJson(json["PubmedData"]);
    } else {
      medlineCitation = null;
      pubmedData = null;
    }
  }
}

class MedlineCitation {
  String status;
  String owner;
  Pmid pmid;
  DateRevised dateRevised;
  Article article;
  MedlineJournalInfo medlineJournalInfo;
  CitationSubset citationSubset;
  KeywordList keywordList;

  MedlineCitation({
    this.status,
    this.owner,
    this.pmid,
    this.dateRevised,
    this.article,
    this.medlineJournalInfo,
    this.citationSubset,
    this.keywordList,
  });

  factory MedlineCitation.fromJson(Map<String, dynamic> json) =>
      MedlineCitation(
        status: json["@Status"],
        owner: json["@Owner"],
        pmid: Pmid.fromJson(json["PMID"]),
        dateRevised: json["PubDate"] != null
            ? DateRevised.fromJson(json["DateRevised"])
            : null,
        article: Article.fromJson(json["Article"]),
        medlineJournalInfo:
            MedlineJournalInfo.fromJson(json["MedlineJournalInfo"]),
        citationSubset: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["CitationSubset"]),
        keywordList: json["KeywordList"] != null
            ? KeywordList.fromJson(json["KeywordList"])
            : null,
      );
}

class Article {
  String pubModel;
  Journal journal;
  CitationSubset articleTitle;
  AuthorList authorList;
  CitationSubset language;
  PublicationTypeList publicationTypeList;
  DateRevised articleDate;

  Article({
    this.pubModel,
    this.journal,
    this.articleTitle,
    this.authorList,
    this.language,
    this.publicationTypeList,
    this.articleDate,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        pubModel: json["@PubModel"],
        journal: Journal.fromJson(json["Journal"]),
        articleTitle: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["ArticleTitle"]),
        authorList: AuthorList.fromJson(json["AuthorList"]),
        language: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["Language"]),
        publicationTypeList:
            PublicationTypeList.fromJson(json["PublicationTypeList"]),
        articleDate: json["ArticleDate"] != null
            ? DateRevised.fromJson(json["ArticleDate"])
            : null,
      );
}

class DateRevised {
  String dateType;
  CitationSubset year;
  CitationSubset month;
  CitationSubset day;

  DateRevised({
    this.dateType,
    this.year,
    this.month,
    this.day,
  });

  factory DateRevised.fromJson(Map<String, dynamic> json) => DateRevised(
        dateType: json["@DateType"] == null ? null : json["@DateType"],
        year: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["Year"]),
        month: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["Month"]),
        day: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["Day"]),
      );

  Map<String, dynamic> toJson() => {
        "@DateType": dateType == null ? null : dateType,
        "Year": year.toJson(),
        "Month": month.toJson(),
        "Day": day.toJson(),
      };
}

class CitationSubset {
  String empty;

  CitationSubset({
    this.empty,
  });

  factory CitationSubset.fromJson(Map<String, dynamic> json) => CitationSubset(
        empty: json["\u0024"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024": empty,
      };
}

class AuthorList {
  Yn completeYn;
  List<Author> author;

  AuthorList({
    this.completeYn,
    this.author,
  });

  // factory AuthorList.fromJson(Map<String, dynamic> json) => AuthorList(
  //     completeYn: ynValues.map[json["@CompleteYN"]],
  //     author: List<Author>.from(json["Author"].map((x) => Author.fromJson(x))),
  // );
  AuthorList.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      String jsonString = json.toString();
      completeYn = ynValues.map[json["@CompleteYN"]];
      if (json["Author"].toString().startsWith("[")) {
        author =
            List<Author>.from(json["Author"].map((x) => Author.fromJson(x)));
      } else {
        author = new List();
        author.add(Author.fromJson(json["Author"]));
      }
    }else{
      author = new List();
      completeYn = null;
    }
  }
  Map<String, dynamic> toJson() => {
        "@CompleteYN": ynValues.reverse[completeYn],
        "Author": List<dynamic>.from(author.map((x) => x.toJson())),
      };
}

class Author {
  Yn validYn;
  CitationSubset lastName;
  CitationSubset foreName;
  CitationSubset initials;
  Identifier identifier;
  dynamic affiliationInfo;

  Author({
    this.validYn,
    this.lastName,
    this.foreName,
    this.initials,
    this.identifier,
    this.affiliationInfo,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        validYn: ynValues.map[json["@ValidYN"]],
        lastName: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["LastName"]),
        foreName: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["ForeName"]),
        initials: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["Initials"]),
        identifier: json["Identifier"] == null
            ? null
            : Identifier.fromJson(json["Identifier"]),
        affiliationInfo: json["AffiliationInfo"],
      );

  Map<String, dynamic> toJson() => {
        "@ValidYN": ynValues.reverse[validYn],
        "LastName": lastName.toJson(),
        "ForeName": foreName.toJson(),
        "Initials": initials.toJson(),
        "Identifier": identifier == null ? null : identifier.toJson(),
        "AffiliationInfo": affiliationInfo,
      };
}

class AffiliationInfoElement {
  CitationSubset affiliation;

  AffiliationInfoElement({
    this.affiliation,
  });

  factory AffiliationInfoElement.fromJson(Map<String, dynamic> json) =>
      AffiliationInfoElement(
        affiliation: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["Affiliation"]),
      );

  Map<String, dynamic> toJson() => {
        "Affiliation": affiliation.toJson(),
      };
}

class Identifier {
  String source;
  String empty;

  Identifier({
    this.source,
    this.empty,
  });

  factory Identifier.fromJson(Map<String, dynamic> json) => Identifier(
        source: json["@Source"],
        empty: json["\u0024"],
      );

  Map<String, dynamic> toJson() => {
        "@Source": source,
        "\u0024": empty,
      };
}

enum Yn { Y }

final ynValues = EnumValues({"Y": Yn.Y});

class ELocationId {
  String eIdType;
  Yn validYn;
  String empty;

  ELocationId({
    this.eIdType,
    this.validYn,
    this.empty,
  });

  factory ELocationId.fromJson(Map<String, dynamic> json) => ELocationId(
        eIdType: json["@EIdType"],
        validYn: ynValues.map[json["@ValidYN"]],
        empty: json["\u0024"],
      );

  Map<String, dynamic> toJson() => {
        "@EIdType": eIdType,
        "@ValidYN": ynValues.reverse[validYn],
        "\u0024": empty,
      };
}

class Journal {
  Issn issn;
  JournalIssue journalIssue;
  CitationSubset title;
  CitationSubset isoAbbreviation;

  Journal({
    this.issn,
    this.journalIssue,
    this.title,
    this.isoAbbreviation,
  });

  factory Journal.fromJson(Map<String, dynamic> json) => Journal(
        issn: Issn.fromJson(json["ISSN"]),
        journalIssue: JournalIssue.fromJson(json["JournalIssue"]),
        title: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["Title"]),
        isoAbbreviation: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["ISOAbbreviation"]),
      );

  Map<String, dynamic> toJson() => {
        "ISSN": issn.toJson(),
        "JournalIssue": journalIssue.toJson(),
        "Title": title.toJson(),
        "ISOAbbreviation": isoAbbreviation.toJson(),
      };
}

class Issn {
  String issnType;
  String empty;

  Issn({
    this.issnType,
    this.empty,
  });

  factory Issn.fromJson(Map<String, dynamic> json) => Issn(
        issnType: json["@IssnType"],
        empty: json["\u0024"],
      );

  Map<String, dynamic> toJson() => {
        "@IssnType": issnType,
        "\u0024": empty,
      };
}

class JournalIssue {
  String citedMedium;
  DateRevised pubDate;

  JournalIssue({
    this.citedMedium,
    this.pubDate,
  });

  factory JournalIssue.fromJson(Map<String, dynamic> json) => JournalIssue(
        citedMedium: json["@CitedMedium"],
        pubDate: json["PubDate"] != null
            ? DateRevised.fromJson(json["PubDate"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "@CitedMedium": citedMedium,
        "PubDate": pubDate.toJson(),
      };
}

class PublicationTypeList {
  List<PublicationType> publicationType;

  PublicationTypeList({
    this.publicationType,
  });

  // factory PublicationTypeList.fromJson(Map<String, dynamic> json) =>
  //     PublicationTypeList(
  //       publicationType: PublicationType.fromJson(json["PublicationType"]),
  //     );
  PublicationTypeList.fromJson(Map<String, dynamic> json) {
    if (json["PublicationType"].toString().startsWith("[")) {
      publicationType = List<PublicationType>.from(
          json["PublicationType"].map((x) => PublicationType.fromJson(x)));
    } else {
      publicationType = new List();
      publicationType.add(PublicationType.fromJson(json["PublicationType"]));
    }
  }
}

class PublicationType {
  String ui;
  String empty;

  PublicationType({
    this.ui,
    this.empty,
  });

  factory PublicationType.fromJson(Map<String, dynamic> json) =>
      PublicationType(
        ui: json["@UI"],
        empty: json["\u0024"],
      );

  Map<String, dynamic> toJson() => {
        "@UI": ui,
        "\u0024": empty,
      };
}

class KeywordList {
  String owner;
  List<Keyword> keyword;

  KeywordList({
    this.owner,
    this.keyword,
  });

  // factory KeywordList.fromJson(Map<String, dynamic> json) => KeywordList(
  //       owner: json["@Owner"],
  //       keyword:
  //           List<Keyword>.from(json["Keyword"].map((x) => Keyword.fromJson(x))),
  //     );

  KeywordList.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      if (json["Keyword"].toString().startsWith("[")) {
        keyword =
            List<Keyword>.from(json["Keyword"].map((x) => Keyword.fromJson(x)));
      } else {
        keyword = new List();
        keyword.add(Keyword.fromJson(json["Keyword"]));
      }
    }
  }

  Map<String, dynamic> toJson() => {
        "@Owner": owner,
        "Keyword": List<dynamic>.from(keyword.map((x) => x.toJson())),
      };
}

class Keyword {
  String majorTopicYn;
  String empty;

  Keyword({
    this.majorTopicYn,
    this.empty,
  });

  factory Keyword.fromJson(Map<String, dynamic> json) => Keyword(
        majorTopicYn: json["@MajorTopicYN"],
        empty: json["\u0024"],
      );

  Map<String, dynamic> toJson() => {
        "@MajorTopicYN": majorTopicYn,
        "\u0024": empty,
      };
}

class MedlineJournalInfo {
  CitationSubset country;
  CitationSubset medlineTa;
  CitationSubset nlmUniqueId;
  CitationSubset issnLinking;

  MedlineJournalInfo({
    this.country,
    this.medlineTa,
    this.nlmUniqueId,
    this.issnLinking,
  });

  factory MedlineJournalInfo.fromJson(Map<String, dynamic> json) =>
      MedlineJournalInfo(
        country: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["Country"]),
        medlineTa: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["MedlineTA"]),
        nlmUniqueId: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["NlmUniqueID"]),
        issnLinking: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["ISSNLinking"]),
      );

  Map<String, dynamic> toJson() => {
        "Country": country.toJson(),
        "MedlineTA": medlineTa.toJson(),
        "NlmUniqueID": nlmUniqueId.toJson(),
        "ISSNLinking": issnLinking.toJson(),
      };
}

class Pmid {
  String version;
  String empty;

  Pmid({
    this.version,
    this.empty,
  });

  factory Pmid.fromJson(Map<String, dynamic> json) => Pmid(
        version: json["@Version"],
        empty: json["\u0024"],
      );

  Map<String, dynamic> toJson() => {
        "@Version": version,
        "\u0024": empty,
      };
}

class PubmedData {
  History history;
  CitationSubset publicationStatus;
  ArticleIdList articleIdList;

  PubmedData({
    this.history,
    this.publicationStatus,
    this.articleIdList,
  });

  factory PubmedData.fromJson(Map<String, dynamic> json) => PubmedData(
        history: History.fromJson(json["History"]),
        publicationStatus: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["PublicationStatus"]),
        articleIdList: json["ArticleIdList"] == null
            ? null
            : ArticleIdList.fromJson(json["ArticleIdList"]),
      );

  Map<String, dynamic> toJson() => {
        "History": history.toJson(),
        "PublicationStatus": publicationStatus.toJson(),
        "ArticleIdList": articleIdList.toJson(),
      };
}

class ArticleIdList {
  List<ArticleId> articleId;

  ArticleIdList({
    this.articleId,
  });

  // factory ArticleIdList.fromJson(Map<String, dynamic> json) => ArticleIdList(
  //       articleId: List<ArticleId>.from(
  //           json["ArticleId"].map((x) => ArticleId.fromJson(x))),
  //     );
  ArticleIdList.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      if (json["ArticleId"].toString().startsWith("[")) {
        articleId = List<ArticleId>.from(
            json["ArticleId"].map((x) => ArticleId.fromJson(x)));
      } else {
        articleId = new List();
        articleId.add(ArticleId.fromJson(json["articleId"]));
      }
    }
  }

  Map<String, dynamic> toJson() => {
        "ArticleId": List<dynamic>.from(articleId.map((x) => x.toJson())),
      };
}

class ArticleId {
  String idType;
  String empty;

  ArticleId({
    this.idType,
    this.empty,
  });

  // factory ArticleId.fromJson(Map<String, dynamic> json) => ArticleId(
  //       idType: json["@IdType"],
  //       empty: json["\u0024"],
  //     );
  ArticleId.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      idType = json["idType"];
      empty = json["empty"];
    } else {
      idType = null;
      empty = null;
    }
  }

  Map<String, dynamic> toJson() => {
        "@IdType": idType,
        "\u0024": empty,
      };
}

class History {
  List<PubMedPubDate> pubMedPubDate;

  History({
    this.pubMedPubDate,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        pubMedPubDate: List<PubMedPubDate>.from(
            json["PubMedPubDate"].map((x) => PubMedPubDate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PubMedPubDate":
            List<dynamic>.from(pubMedPubDate.map((x) => x.toJson())),
      };
}

class PubMedPubDate {
  String pubStatus;
  CitationSubset year;
  CitationSubset month;
  CitationSubset day;
  CitationSubset hour;
  CitationSubset minute;

  PubMedPubDate({
    this.pubStatus,
    this.year,
    this.month,
    this.day,
    this.hour,
    this.minute,
  });

  factory PubMedPubDate.fromJson(Map<String, dynamic> json) => PubMedPubDate(
        pubStatus: json["@PubStatus"],
        year: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["Year"]),
        month: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["Month"]),
        day: json["Identifier"] == null
            ? null
            : CitationSubset.fromJson(json["Day"]),
        hour: json["Hour"] == null
            ? null
            : json["Identifier"] == null
                ? null
                : CitationSubset.fromJson(json["Hour"]),
        minute: json["Minute"] == null
            ? null
            : json["Identifier"] == null
                ? null
                : CitationSubset.fromJson(json["Minute"]),
      );

  Map<String, dynamic> toJson() => {
        "@PubStatus": pubStatus,
        "Year": year.toJson(),
        "Month": month.toJson(),
        "Day": day.toJson(),
        "Hour": hour == null ? null : hour.toJson(),
        "Minute": minute == null ? null : minute.toJson(),
      };
}

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
