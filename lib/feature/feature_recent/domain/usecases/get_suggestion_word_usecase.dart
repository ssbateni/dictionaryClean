import 'package:dictionary_clean/core/resources/data_state.dart';
import 'package:dictionary_clean/core/usecase/usecase.dart';
import 'package:dictionary_clean/feature/feature_recent/domain/repository/recent_repository.dart';

class GetSuggestionWordUseCase extends UseCase<List<String>,String>{

  final RecentRepository recentRepository;

  GetSuggestionWordUseCase(this.recentRepository);

  @override
  Future<List<String>> call(String param) {
    return recentRepository.fetchSuggestWord(param);
  }




}