import 'package:dictionary_clean/feature/feature_dictionary/data/data_source/remote/api_provider.dart';
import 'package:dictionary_clean/feature/feature_dictionary/data/repository/dictionary_repository_impl.dart';
import 'package:dictionary_clean/feature/feature_dictionary/domain/repository/dictionary_repository.dart';
import 'package:dictionary_clean/feature/feature_dictionary/domain/usecases/dictionary_search_usecase.dart';
import 'package:dictionary_clean/feature/feature_dictionary/presentation/bloc/dictionary_bloc.dart';
import 'package:dictionary_clean/feature/feature_recent/data/repository/recent_repository_impl.dart';
import 'package:dictionary_clean/feature/feature_recent/domain/repository/recent_repository.dart';
import 'package:dictionary_clean/feature/feature_recent/domain/usecases/get_suggestion_word_usecase.dart';
import 'package:get_it/get_it.dart';

import 'feature/feature_recent/data/data_source/remote/api_provider.dart';

GetIt locator = GetIt.instance;

setup() {
  locator.registerSingleton<ApiProvider>(ApiProvider());
  locator.registerSingleton<ApiProviderRecent>(ApiProviderRecent());

  ///repositories
  locator.registerSingleton<DictionaryRepository>(
      DictionaryRepositoryImpl(locator()));

  locator.registerSingleton<RecentRepository>(
    RecentRepositoryImpl(locator()));

  /// use cases
  locator.registerSingleton<DictionarySearchUseCase>(
      DictionarySearchUseCase(locator()));

  locator.registerSingleton<GetSuggestionWordUseCase>(
      GetSuggestionWordUseCase(locator()));

  ///bloc
  locator.registerSingleton<DictionaryBloc>(DictionaryBloc(locator()));
}
