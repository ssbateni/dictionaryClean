import 'package:dictionary_clean/core/resources/data_state.dart';
import 'package:dictionary_clean/feature/feature_dictionary/domain/entities/dictionary_entity.dart';

abstract class DictionaryRepository{

  Future<DataState<DictionaryEntity>>fetchDictionarySearch(String word);

}