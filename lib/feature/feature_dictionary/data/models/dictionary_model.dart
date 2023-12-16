import 'package:dictionary_clean/feature/feature_dictionary/domain/entities/dictionary_entity.dart';

class DictionaryModel extends DictionaryEntity {
  const DictionaryModel({
    String? word,
    String? phonetic,
    List<Phonetics>? phonetics,
    String? origin,
    List<Meanings>? meanings,
  }) : super(
            word: word,
            phonetic: phonetic,
            phonetics: phonetics,
            origin: origin,
            meanings: meanings);

  factory DictionaryModel.fromJson(Map<String, dynamic> json) {
    List<Phonetics> phonetics = [];
    if (json['phonetics'] != null) {
      phonetics = [];
      json['phonetics'].forEach((v) {
        phonetics.add(Phonetics.fromJson(v));
      });
    }
    List<Meanings> meanings = [];
    if (json['meanings'] != null) {
      meanings = [];
      json['meanings'].forEach((v) {
        meanings.add(Meanings.fromJson(v));
      });
    }

    return DictionaryModel(
        word: json['word'] as String?,
        phonetic: json['phonetic'] as String?,
        phonetics: phonetics,
        origin: json['origin'] as String?,
        meanings: meanings);
  }
// Map<String, dynamic> toJson() => {
//   'word' : word,
//   'phonetic' : phonetic,
//   'phonetics' : phonetics?.map((e) => e.toJson()).toList(),
//   'origin' : origin,
//   'meanings' : meanings?.map((e) => e.toJson()).toList()
// };
}

class Phonetics {
  final String? text;
  final String? audio;

  Phonetics({
    this.text,
    this.audio,
  });

  factory Phonetics.fromJson(Map<String, dynamic> json) {
    return Phonetics(
        text: json['text'] as String?, audio: json['audio'] as String?);
  }

  Map<String, dynamic> toJson() => {'text': text, 'audio': audio};
}

class Meanings {
  final String? partOfSpeech;
  final List<Definitions>? definitions;
  final List<String>? synonyms;
  final List<String>? antonyms;

  Meanings({
    this.partOfSpeech,
    this.definitions,
    this.synonyms,
    this.antonyms,
  });

  factory Meanings.fromJson(Map<String, dynamic> json) {
    List<Definitions> definitions = [];
    if (json['definitions'] != null) {
      definitions = [];
      json['definitions'].forEach((v) {
        definitions.add(Definitions.fromJson(v));
      });
    }
    List<String> synonyms = [];
    if (json['synonyms'] != null) {
      synonyms = [];
      json['synonyms'].forEach((v) {
        synonyms.add(v);
      });
    }
    List<String> antonyms = [];
    if (json['antonyms'] != null) {
      antonyms = [];
      json['antonyms'].forEach((v) {
        antonyms.add(v);
      });
    }
    return Meanings(
        definitions: definitions,
        partOfSpeech: json['partOfSpeech'] as String?,
        synonyms: synonyms,
        antonyms: antonyms);
  }

  Map<String, dynamic> toJson() => {
        'partOfSpeech': partOfSpeech,
        'definitions': definitions?.map((e) => e.toJson()).toList(),
        'synonyms': synonyms,
        'antonyms': antonyms
      };
}

class Definitions {
  final String? definition;
  final String? example;
  final List<String>? synonyms;
  final List<String>? antonyms;

  Definitions({
    this.definition,
    this.example,
    this.synonyms,
    this.antonyms,
  });

  factory Definitions.fromJson(Map<String, dynamic> json) {
    List<String> synonyms = [];
    if (json['synonyms'] != null) {
      synonyms = [];
      json['synonyms'].forEach((v) {
        synonyms.add(v);
      });
    }
    List<String> antonyms = [];
    if (json['antonyms'] != null) {
      antonyms = [];
      json['antonyms'].forEach((v) {
        antonyms.add(v);
      });
    }
    return Definitions(
        definition: json['definition'] as String?,
        example: json['example'] as String?,
        synonyms: synonyms,
        antonyms: antonyms);
  }

  Map<String, dynamic> toJson() => {
        'definition': definition,
        'example': example,
        'synonyms': synonyms,
        'antonyms': antonyms
      };
}
