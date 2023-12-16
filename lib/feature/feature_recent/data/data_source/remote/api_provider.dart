import 'package:dictionary_clean/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiProviderRecent{

  final Dio _dio = Dio();

  callSuggestWord(word)async{
    var response = await _dio.get(
        Constants.baseUrlSuggest + word);
     print(  response.data );
    return response;
  }

}