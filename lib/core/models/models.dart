import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;
  final SearchInfo? searchInfo;

  const BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    required this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      kind: json['kind'] as String?,
      id: json['id'] as String?,
      etag: json['etag'] as String?,
      selfLink: json['selfLink'] as String?,
      volumeInfo:
          VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      saleInfo: json['saleInfo'] != null
          ? SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>)
          : null,
      accessInfo: json['accessInfo'] != null
          ? AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>)
          : null,
      searchInfo: json['searchInfo'] != null
          ? SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props =>
      [kind, id, etag, selfLink, volumeInfo, saleInfo, accessInfo, searchInfo];
}

class VolumeInfo extends Equatable {
  final String? title;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final List<IndustryIdentifier>? industryIdentifiers;
  final ReadingModes? readingModes;
  final int? pageCount;
  final String? printType;
  final List<String>? categories;
  final dynamic averageRating;
  final int? ratingsCount;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final PanelizationSummary? panelizationSummary;
  final ImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  const VolumeInfo({
    this.averageRating,
    this.ratingsCount,
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    var authorsFromJson = json['authors'];
    List<String>? authorsList = authorsFromJson != null
        ? List<String>.from(authorsFromJson as List<dynamic>)
        : null;

    return VolumeInfo(
      title: json['title'] as String?,
      authors: authorsList,
      publisher: json['publisher'] as String?,
      publishedDate: json['publishedDate'] as String?,
      description: json['description'] as String?,
      industryIdentifiers: json['industryIdentifiers'] != null
          ? (json['industryIdentifiers'] as List<dynamic>)
              .map(
                  (i) => IndustryIdentifier.fromJson(i as Map<String, dynamic>))
              .toList()
          : null,
      readingModes: json['readingModes'] != null
          ? ReadingModes.fromJson(json['readingModes'] as Map<String, dynamic>)
          : null,
      pageCount: json['pageCount'] as int?,
      printType: json['printType'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      averageRating: json['averageRating'],
      ratingsCount: json['ratingsCount'] as int?,
      maturityRating: json['maturityRating'] as String?,
      allowAnonLogging: json['allowAnonLogging'] as bool?,
      contentVersion: json['contentVersion'] as String?,
      panelizationSummary: json['panelizationSummary'] != null
          ? PanelizationSummary.fromJson(
              json['panelizationSummary'] as Map<String, dynamic>)
          : null,
      imageLinks: json['imageLinks'] != null
          ? ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>)
          : null,
      language: json['language'] as String?,
      previewLink: json['previewLink'] as String?,
      infoLink: json['infoLink'] as String?,
      canonicalVolumeLink: json['canonicalVolumeLink'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        title,
        averageRating,
        ratingsCount,
        authors,
        publisher,
        publishedDate,
        description,
        industryIdentifiers,
        readingModes,
        pageCount,
        printType,
        categories,
        maturityRating,
        allowAnonLogging,
        contentVersion,
        panelizationSummary,
        imageLinks,
        language,
        previewLink,
        infoLink,
        canonicalVolumeLink,
      ];
}

class IndustryIdentifier extends Equatable {
  final String? type;
  final String? identifier;

  const IndustryIdentifier({
    this.type,
    this.identifier,
  });

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) {
    return IndustryIdentifier(
      type: json['type'] as String?,
      identifier: json['identifier'] as String?,
    );
  }

  @override
  List<Object?> get props => [type, identifier];
}

class ReadingModes extends Equatable {
  final bool? text;
  final bool? image;

  const ReadingModes({
    this.text,
    this.image,
  });

  factory ReadingModes.fromJson(Map<String, dynamic> json) {
    return ReadingModes(
      text: json['text'] as bool?,
      image: json['image'] as bool?,
    );
  }

  @override
  List<Object?> get props => [text, image];
}

class PanelizationSummary extends Equatable {
  final bool? containsEpubBubbles;
  final bool? containsImageBubbles;

  const PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) {
    return PanelizationSummary(
      containsEpubBubbles: json['containsEpubBubbles'] as bool?,
      containsImageBubbles: json['containsImageBubbles'] as bool?,
    );
  }

  @override
  List<Object?> get props => [containsEpubBubbles, containsImageBubbles];
}

class ImageLinks extends Equatable {
  final String smallThumbnail;
  final String thumbnail;

  const ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  factory ImageLinks.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const ImageLinks(
        smallThumbnail: '',
        thumbnail: '',
      );
    }
    return ImageLinks(
      smallThumbnail: json['smallThumbnail'] as String,
      thumbnail: json['thumbnail'] as String,
    );
  }

  @override
  List<Object?> get props => [smallThumbnail, thumbnail];
}

class SaleInfo extends Equatable {
  final String? country;
  final String? saleability;
  final bool? isEbook;

  const SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) {
    return SaleInfo(
      country: json['country'] as String?,
      saleability: json['saleability'] as String?,
      isEbook: json['isEbook'] as bool?,
    );
  }

  @override
  List<Object?> get props => [country, saleability, isEbook];
}

class AccessInfo extends Equatable {
  final String? country;
  final String? viewability;
  final bool? embeddable;
  final bool? publicDomain;
  final String? textToSpeechPermission;
  final Epub? epub;
  final Pdf? pdf;
  final String? webReaderLink;
  final String? accessViewStatus;
  final bool? quoteSharingAllowed;

  const AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) {
    return AccessInfo(
      country: json['country'] as String?,
      viewability: json['viewability'] as String?,
      embeddable: json['embeddable'] as bool?,
      publicDomain: json['publicDomain'] as bool?,
      textToSpeechPermission: json['textToSpeechPermission'] as String?,
      epub: json['epub'] != null
          ? Epub.fromJson(json['epub'] as Map<String, dynamic>)
          : null,
      pdf: json['pdf'] != null
          ? Pdf.fromJson(json['pdf'] as Map<String, dynamic>)
          : null,
      webReaderLink: json['webReaderLink'] as String?,
      accessViewStatus: json['accessViewStatus'] as String?,
      quoteSharingAllowed: json['quoteSharingAllowed'] as bool?,
    );
  }

  @override
  List<Object?> get props => [
        country,
        viewability,
        embeddable,
        publicDomain,
        textToSpeechPermission,
        epub,
        pdf,
        webReaderLink,
        accessViewStatus,
        quoteSharingAllowed,
      ];
}

class Epub extends Equatable {
  final bool? isAvailable;

  const Epub({
    this.isAvailable,
  });

  factory Epub.fromJson(Map<String, dynamic> json) {
    return Epub(
      isAvailable: json['isAvailable'] as bool?,
    );
  }

  @override
  List<Object?> get props => [isAvailable];
}

class Pdf extends Equatable {
  final bool? isAvailable;
  final String? acsTokenLink;

  const Pdf({
    this.isAvailable,
    this.acsTokenLink,
  });

  factory Pdf.fromJson(Map<String, dynamic> json) {
    return Pdf(
      isAvailable: json['isAvailable'] as bool?,
      acsTokenLink: json['acsTokenLink'] as String?,
    );
  }

  @override
  List<Object?> get props => [isAvailable, acsTokenLink];
}

class SearchInfo extends Equatable {
  final String? textSnippet;

  const SearchInfo({
    this.textSnippet,
  });

  factory SearchInfo.fromJson(Map<String, dynamic> json) {
    return SearchInfo(
      textSnippet: json['textSnippet'] as String?,
    );
  }

  @override
  List<Object?> get props => [textSnippet];
}
