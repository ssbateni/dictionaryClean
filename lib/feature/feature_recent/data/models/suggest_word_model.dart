import 'package:dictionary_clean/feature/feature_recent/domain/entities/suggest_word_entity.dart';

/// word : "rwanda"
/// score : 279

class SuggestWordModel extends SuggestWordEntity{

  SuggestWordModel({
    String? word,
    int? score,
  }): super(
    word:word,
    score:score
  );

  factory SuggestWordModel.fromJson(Map<String, dynamic> json) {
    return SuggestWordModel(
    word : json['word'],
    score : json['score']
    );
  }

  Map<String, dynamic> toJson() => {'word': word, 'score': score};


}