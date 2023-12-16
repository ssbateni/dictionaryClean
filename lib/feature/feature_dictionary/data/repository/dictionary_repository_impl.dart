 import 'package:dictionary_clean/core/resources/data_state.dart';
import 'package:dictionary_clean/feature/feature_dictionary/data/data_source/remote/api_provider.dart';
import 'package:dictionary_clean/feature/feature_dictionary/data/models/dictionary_model.dart';
import 'package:dictionary_clean/feature/feature_dictionary/domain/entities/dictionary_entity.dart';
import 'package:dictionary_clean/feature/feature_dictionary/domain/repository/dictionary_repository.dart';
import 'package:dio/dio.dart';

import '../models/DictionaryModel.dart';

class DictionaryRepositoryImpl extends DictionaryRepository{

  ApiProvider apiProvider;
  DictionaryRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<DictionaryEntity>> fetchDictionarySearch(String word)async {
    try{
      Response response = await apiProvider.callSearchDictionary(word);

      if(response.statusCode == 200 ){
        DictionaryEntity dictionaryEntity  = DictionaryModel.fromJson(response.data[0]);
        print( response.statusCode.toString() );
        return DataSuccess(dictionaryEntity);
      }
      else{
        print( "response.statusCode.toString() ");
        return  DataFailed("sth went wrong statusCode is : ${response.statusCode}");
      }
    }
    catch(e){
      print( "response.statusCode.toString() df" +e.toString());
      return  DataFailed("please check your connection... ${e.toString}");
    }
  }


}