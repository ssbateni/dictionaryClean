 import 'package:dictionary_clean/core/resources/data_state.dart';
import 'package:dictionary_clean/feature/feature_recent/data/models/suggest_word_model.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/suggest_word_entity.dart';
import '../../domain/repository/recent_repository.dart';
import '../data_source/remote/api_provider.dart';




class RecentRepositoryImpl extends RecentRepository{

  ApiProviderRecent apiProvider;
  RecentRepositoryImpl(this.apiProvider);

  @override
  Future<List<String>> fetchSuggestWord(String word) async{

    List<String> suggestWord = [];
    Response response = await apiProvider.callSuggestWord(word);


    response.data.forEach((item) {
      SuggestWordEntity suggestWordEntity = SuggestWordModel.fromJson(item);
      suggestWord.add(suggestWordEntity.word??"");
    });


    return suggestWord;

  }


}

