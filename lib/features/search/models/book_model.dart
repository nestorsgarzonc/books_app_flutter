import 'dart:convert';

import 'dart:math';

Books booksFromJson(String str) => Books.fromJson(json.decode(str));

String booksToJson(Books data) => json.encode(data.toJson());

class Books {
  Books({
    this.numFound,
    this.start,
    this.numFoundExact,
    this.docs,
    this.booksNumFound,
    this.q,
    this.offset,
  });

  int? numFound;
  int? start;
  bool? numFoundExact;
  List<Doc>? docs;
  int? booksNumFound;
  String? q;
  dynamic offset;

  factory Books.fromJson(Map<String, dynamic> json) => Books(
        numFound: json["numFound"],
        start: json["start"],
        numFoundExact: json["numFoundExact"],
        docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
        booksNumFound: json["num_found"],
        q: json["q"],
        offset: json["offset"],
      );

  Map<String, dynamic> toJson() => {
        "numFound": numFound,
        "start": start,
        "numFoundExact": numFoundExact,
        "docs": List<dynamic>.from(docs ?? [].map((x) => x.toJson())),
        "num_found": booksNumFound,
        "q": q,
        "offset": offset,
      };
}

class Doc {
  Doc({
    this.key,
    this.text,
    this.type,
    this.seed,
    this.title,
    this.titleSuggest,
    this.hasFulltext,
    this.editionCount,
    this.editionKey,
    this.publishDate,
    this.publishYear,
    this.firstPublishYear,
    this.lccn,
    this.publishPlace,
    this.oclc,
    this.contributor,
    this.lcc,
    this.ddc,
    this.isbn,
    this.lastModifiedI,
    this.ebookCountI,
    this.ia,
    this.publicScanB,
    this.iaCollectionS,
    this.lendingEditionS,
    this.lendingIdentifierS,
    this.printdisabledS,
    this.coverEditionKey,
    this.coverI,
    this.publisher,
    this.language,
    this.authorKey,
    this.authorName,
    this.authorAlternativeName,
    this.person,
    this.place,
    this.subject,
    this.time,
    this.idAlibrisId,
    this.idAmazon,
    this.idCanadianNationalLibraryArchive,
    this.idGoodreads,
    this.idGoogle,
    this.idLibrarything,
    this.idOverdrive,
    this.idPaperbackSwap,
    this.idWikidata,
    this.iaLoadedId,
    this.iaBoxId,
    this.idDepSitoLegal,
    this.publisherFacet,
    this.personKey,
    this.timeFacet,
    this.placeKey,
    this.personFacet,
    this.subjectFacet,
    this.version,
    this.placeFacet,
    this.lccSort,
    this.authorFacet,
    this.subjectKey,
    this.timeKey,
    this.ddcSort,
    this.firstSentence,
    this.subtitle,
    this.idBcid,
  });

  String? key;
  List<String?>? text;
  Type? type;
  List<String?>? seed;
  String? title;
  String? titleSuggest;
  bool? hasFulltext;
  int? editionCount;
  List<String?>? editionKey;
  List<String?>? publishDate;
  List<int?>? publishYear;
  int? firstPublishYear;
  List<String?>? lccn;
  List<String?>? publishPlace;
  List<String?>? oclc;
  List<String?>? contributor;
  List<String?>? lcc;
  List<String?>? ddc;
  List<String?>? isbn;
  int? lastModifiedI;
  int? ebookCountI;
  List<String?>? ia;
  bool? publicScanB;
  String? iaCollectionS;
  String? lendingEditionS;
  String? lendingIdentifierS;
  String? printdisabledS;
  String? coverEditionKey;
  int? coverI;
  List<String?>? publisher;
  List<String?>? language;
  List<String?>? authorKey;
  List<String?>? authorName;
  List<String?>? authorAlternativeName;
  List<String?>? person;
  List<String?>? place;
  List<String?>? subject;
  List<String?>? time;
  List<String?>? idAlibrisId;
  List<String?>? idAmazon;
  List<String?>? idCanadianNationalLibraryArchive;
  List<String?>? idGoodreads;
  List<String?>? idGoogle;
  List<String?>? idLibrarything;
  List<String?>? idOverdrive;
  List<String?>? idPaperbackSwap;
  List<String?>? idWikidata;
  List<String?>? iaLoadedId;
  List<String?>? iaBoxId;
  List<String?>? idDepSitoLegal;
  List<String?>? publisherFacet;
  List<String?>? personKey;
  List<String?>? timeFacet;
  List<String?>? placeKey;
  List<String?>? personFacet;
  List<String?>? subjectFacet;
  double? version;
  List<String?>? placeFacet;
  String? lccSort;
  List<String?>? authorFacet;
  List<String?>? subjectKey;
  List<String?>? timeKey;
  String? ddcSort;
  List<String?>? firstSentence;
  String? subtitle;
  List<String?>? idBcid;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        key: json["key"],
        text: List<String>.from(json["text"].map((x) => x)),
        type: typeValues.map![json["type"]],
        seed: List<String>.from(json["seed"].map((x) => x)),
        title: json["title"],
        titleSuggest: json["title_suggest"],
        hasFulltext: json["has_fulltext"],
        editionCount: json["edition_count"],
        editionKey: List<String>.from(json["edition_key"].map((x) => x)),
        publishDate: json["publish_date"] == null
            ? null
            : List<String>.from(json["publish_date"].map((x) => x)),
        publishYear: json["publish_year"] == null
            ? null
            : List<int>.from(json["publish_year"].map((x) => x)),
        firstPublishYear: json["first_publish_year"],
        lccn: json["lccn"] == null ? null : List<String>.from(json["lccn"].map((x) => x)),
        publishPlace: json["publish_place"] == null
            ? null
            : List<String>.from(json["publish_place"].map((x) => x)),
        oclc: json["oclc"] == null ? null : List<String>.from(json["oclc"].map((x) => x)),
        contributor: json["contributor"] == null
            ? null
            : List<String>.from(json["contributor"].map((x) => x)),
        lcc: json["lcc"] == null ? null : List<String>.from(json["lcc"].map((x) => x)),
        ddc: json["ddc"] == null ? null : List<String>.from(json["ddc"].map((x) => x)),
        isbn: json["isbn"] == null ? null : List<String>.from(json["isbn"].map((x) => x)),
        lastModifiedI: json["last_modified_i"],
        ebookCountI: json["ebook_count_i"],
        ia: json["ia"] == null ? null : List<String>.from(json["ia"].map((x) => x)),
        publicScanB: json["public_scan_b"],
        iaCollectionS: json["ia_collection_s"],
        lendingEditionS: json["lending_edition_s"],
        lendingIdentifierS: json["lending_identifier_s"],
        printdisabledS: json["printdisabled_s"],
        coverEditionKey: json["cover_edition_key"],
        coverI: json["cover_i"],
        publisher:
            json["publisher"] == null ? null : List<String>.from(json["publisher"].map((x) => x)),
        language:
            json["language"] == null ? null : List<String>.from(json["language"].map((x) => x)),
        authorKey:
            json["author_key"] == null ? null : List<String>.from(json["author_key"].map((x) => x)),
        authorName: json["author_name"] == null
            ? null
            : List<String>.from(json["author_name"].map((x) => x)),
        authorAlternativeName: json["author_alternative_name"] == null
            ? null
            : List<String>.from(json["author_alternative_name"].map((x) => x)),
        person: json["person"] == null ? null : List<String>.from(json["person"].map((x) => x)),
        place: json["place"] == null ? null : List<String>.from(json["place"].map((x) => x)),
        subject: json["subject"] == null ? null : List<String>.from(json["subject"].map((x) => x)),
        time: json["time"] == null ? null : List<String>.from(json["time"].map((x) => x)),
        idAlibrisId: json["id_alibris_id"] == null
            ? null
            : List<String>.from(json["id_alibris_id"].map((x) => x)),
        idAmazon:
            json["id_amazon"] == null ? null : List<String>.from(json["id_amazon"].map((x) => x)),
        idCanadianNationalLibraryArchive: json["id_canadian_national_library_archive"] == null
            ? null
            : List<String>.from(json["id_canadian_national_library_archive"].map((x) => x)),
        idGoodreads: json["id_goodreads"] == null
            ? null
            : List<String>.from(json["id_goodreads"].map((x) => x)),
        idGoogle:
            json["id_google"] == null ? null : List<String>.from(json["id_google"].map((x) => x)),
        idLibrarything: json["id_librarything"] == null
            ? null
            : List<String>.from(json["id_librarything"].map((x) => x)),
        idOverdrive: json["id_overdrive"] == null
            ? null
            : List<String>.from(json["id_overdrive"].map((x) => x)),
        idPaperbackSwap: json["id_paperback_swap"] == null
            ? null
            : List<String>.from(json["id_paperback_swap"].map((x) => x)),
        idWikidata: json["id_wikidata"] == null
            ? null
            : List<String>.from(json["id_wikidata"].map((x) => x)),
        iaLoadedId: json["ia_loaded_id"] == null
            ? null
            : List<String>.from(json["ia_loaded_id"].map((x) => x)),
        iaBoxId:
            json["ia_box_id"] == null ? null : List<String>.from(json["ia_box_id"].map((x) => x)),
        idDepSitoLegal: json["id_dep_sito_legal"] == null
            ? null
            : List<String>.from(json["id_dep_sito_legal"].map((x) => x)),
        publisherFacet: json["publisher_facet"] == null
            ? null
            : List<String>.from(json["publisher_facet"].map((x) => x)),
        personKey:
            json["person_key"] == null ? null : List<String>.from(json["person_key"].map((x) => x)),
        timeFacet:
            json["time_facet"] == null ? null : List<String>.from(json["time_facet"].map((x) => x)),
        placeKey:
            json["place_key"] == null ? null : List<String>.from(json["place_key"].map((x) => x)),
        personFacet: json["person_facet"] == null
            ? null
            : List<String>.from(json["person_facet"].map((x) => x)),
        subjectFacet: json["subject_facet"] == null
            ? null
            : List<String>.from(json["subject_facet"].map((x) => x)),
        version: json["_version_"].toDouble(),
        placeFacet: json["place_facet"] == null
            ? null
            : List<String>.from(json["place_facet"].map((x) => x)),
        lccSort: json["lcc_sort"],
        authorFacet: json["author_facet"] == null
            ? null
            : List<String>.from(json["author_facet"].map((x) => x)),
        subjectKey: json["subject_key"] == null
            ? null
            : List<String>.from(json["subject_key"].map((x) => x)),
        timeKey:
            json["time_key"] == null ? null : List<String>.from(json["time_key"].map((x) => x)),
        ddcSort: json["ddc_sort"],
        firstSentence: json["first_sentence"] == null
            ? null
            : List<String>.from(json["first_sentence"].map((x) => x)),
        subtitle: json["subtitle"],
        idBcid: json["id_bcid"] == null ? null : List<String>.from(json["id_bcid"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "text": List<dynamic>.from(text ?? [].map((x) => x)),
        "type": typeValues.reverse[type],
        "seed": List<dynamic>.from(seed ?? [].map((x) => x)),
        "title": title,
        "title_suggest": titleSuggest,
        "has_fulltext": hasFulltext,
        "edition_count": editionCount,
        "edition_key": List<dynamic>.from(editionKey ?? [].map((x) => x)),
        "publish_date":
            publishDate == null ? null : List<dynamic>.from(publishDate ?? [].map((x) => x)),
        "publish_year":
            publishYear == null ? null : List<dynamic>.from(publishYear ?? [].map((x) => x)),
        "first_publish_year": firstPublishYear,
        "lccn": lccn == null ? null : List<dynamic>.from(lccn ?? [].map((x) => x)),
        "publish_place":
            publishPlace == null ? null : List<dynamic>.from(publishPlace ?? [].map((x) => x)),
        "oclc": oclc == null ? null : List<dynamic>.from(oclc ?? [].map((x) => x)),
        "contributor":
            contributor == null ? null : List<dynamic>.from(contributor ?? [].map((x) => x)),
        "lcc": lcc == null ? null : List<dynamic>.from(lcc ?? [].map((x) => x)),
        "ddc": ddc == null ? null : List<dynamic>.from(ddc ?? [].map((x) => x)),
        "isbn": isbn == null ? null : List<dynamic>.from(isbn ?? [].map((x) => x)),
        "last_modified_i": lastModifiedI,
        "ebook_count_i": ebookCountI,
        "ia": ia == null ? null : List<dynamic>.from(ia ?? [].map((x) => x)),
        "public_scan_b": publicScanB,
        "ia_collection_s": iaCollectionS,
        "lending_edition_s": lendingEditionS,
        "lending_identifier_s": lendingIdentifierS,
        "printdisabled_s": printdisabledS,
        "cover_edition_key": coverEditionKey,
        "cover_i": coverI,
        "publisher": publisher == null ? null : List<dynamic>.from(publisher ?? [].map((x) => x)),
        "language": language == null ? null : List<dynamic>.from(language ?? [].map((x) => x)),
        "author_key": authorKey == null ? null : List<dynamic>.from(authorKey ?? [].map((x) => x)),
        "author_name":
            authorName == null ? null : List<dynamic>.from(authorName ?? [].map((x) => x)),
        "author_alternative_name": authorAlternativeName == null
            ? null
            : List<dynamic>.from(authorAlternativeName ?? [].map((x) => x)),
        "person": person == null ? null : List<dynamic>.from(person ?? [].map((x) => x)),
        "place": place == null ? null : List<dynamic>.from(place ?? [].map((x) => x)),
        "subject": subject == null ? null : List<dynamic>.from(subject ?? [].map((x) => x)),
        "time": time == null ? null : List<dynamic>.from(time ?? [].map((x) => x)),
        "id_alibris_id":
            idAlibrisId == null ? null : List<dynamic>.from(idAlibrisId ?? [].map((x) => x)),
        "id_amazon": idAmazon == null ? null : List<dynamic>.from(idAmazon ?? [].map((x) => x)),
        "id_canadian_national_library_archive": idCanadianNationalLibraryArchive == null
            ? null
            : List<dynamic>.from(idCanadianNationalLibraryArchive ?? [].map((x) => x)),
        "id_goodreads":
            idGoodreads == null ? null : List<dynamic>.from(idGoodreads ?? [].map((x) => x)),
        "id_google": idGoogle == null ? null : List<dynamic>.from(idGoogle ?? [].map((x) => x)),
        "id_librarything":
            idLibrarything == null ? null : List<dynamic>.from(idLibrarything ?? [].map((x) => x)),
        "id_overdrive":
            idOverdrive == null ? null : List<dynamic>.from(idOverdrive ?? [].map((x) => x)),
        "id_paperback_swap": idPaperbackSwap == null
            ? null
            : List<dynamic>.from(idPaperbackSwap ?? [].map((x) => x)),
        "id_wikidata":
            idWikidata == null ? null : List<dynamic>.from(idWikidata ?? [].map((x) => x)),
        "ia_loaded_id":
            iaLoadedId == null ? null : List<dynamic>.from(iaLoadedId ?? [].map((x) => x)),
        "ia_box_id": iaBoxId == null ? null : List<dynamic>.from(iaBoxId ?? [].map((x) => x)),
        "id_dep_sito_legal":
            idDepSitoLegal == null ? null : List<dynamic>.from(idDepSitoLegal ?? [].map((x) => x)),
        "publisher_facet":
            publisherFacet == null ? null : List<dynamic>.from(publisherFacet ?? [].map((x) => x)),
        "person_key": personKey == null ? null : List<dynamic>.from(personKey ?? [].map((x) => x)),
        "time_facet": timeFacet == null ? null : List<dynamic>.from(timeFacet ?? [].map((x) => x)),
        "place_key": placeKey == null ? null : List<dynamic>.from(placeKey ?? [].map((x) => x)),
        "person_facet":
            personFacet == null ? null : List<dynamic>.from(personFacet ?? [].map((x) => x)),
        "subject_facet":
            subjectFacet == null ? null : List<dynamic>.from(subjectFacet ?? [].map((x) => x)),
        "_version_": version,
        "place_facet":
            placeFacet == null ? null : List<dynamic>.from(placeFacet ?? [].map((x) => x)),
        "lcc_sort": lccSort,
        "author_facet":
            authorFacet == null ? null : List<dynamic>.from(authorFacet ?? [].map((x) => x)),
        "subject_key":
            subjectKey == null ? null : List<dynamic>.from(subjectKey ?? [].map((x) => x)),
        "time_key": timeKey == null ? null : List<dynamic>.from(timeKey ?? [].map((x) => x)),
        "ddc_sort": ddcSort,
        "first_sentence":
            firstSentence == null ? null : List<dynamic>.from(firstSentence ?? [].map((x) => x)),
        "subtitle": subtitle,
        "id_bcid": idBcid == null ? null : List<dynamic>.from(idBcid ?? [].map((x) => x)),
      };

  String getParsedTitle() {
    if (title == null) {
      return '';
    }
    final len = title!.length;
    return title!.substring(0, min(40, len)) + '...';
  }
}

enum Type { work }

final typeValues = EnumValues({"work": Type.work});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map?.map((k, v) => MapEntry(v, k));
    return reverseMap ?? {};
  }
}
