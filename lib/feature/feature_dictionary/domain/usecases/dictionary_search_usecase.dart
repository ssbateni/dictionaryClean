import 'package:dictionary_clean/core/resources/data_state.dart';
import 'package:dictionary_clean/core/usecase/usecase.dart';
import 'package:dictionary_clean/feature/feature_dictionary/domain/entities/dictionary_entity.dart';
import 'package:dictionary_clean/feature/feature_dictionary/domain/repository/dictionary_repository.dart';

class DictionarySearchUseCase extends UseCase<DataState<DictionaryEntity>,String>{

  final DictionaryRepository dictionaryRepository;

  DictionarySearchUseCase(this.dictionaryRepository);

  @override
  Future<DataState<DictionaryEntity>> call(String param) {
    return dictionaryRepository.fetchDictionarySearch(param);
  }



}