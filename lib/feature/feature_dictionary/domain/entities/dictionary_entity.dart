import 'package:equatable/equatable.dart';

import '../../data/models/DictionaryModel.dart';
import '../../data/models/dictionary_model.dart';


class DictionaryEntity extends Equatable {
  final String? word;
  final String? phonetic;
  final List<Phonetics>? phonetics;
  final String? origin;
  final List<Meanings>? meanings;
  const DictionaryEntity(
      {this.word, this.phonetic, this.phonetics, this.origin, this.meanings});



  @override
  // TODO: implement props
  List<Object?> get props => [
    word,
    meanings
  ];
}
