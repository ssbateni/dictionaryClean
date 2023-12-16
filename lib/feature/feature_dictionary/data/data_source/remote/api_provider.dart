import 'package:dictionary_clean/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiProvider{

  final Dio _dio = Dio();

  callSearchDictionary(word)async{
    var response = await _dio.get(
        Constants.baseUrl + word
    );

     print(  response.data );

    return response;
  }

}