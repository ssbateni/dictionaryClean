import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dictionary_clean/core/resources/data_state.dart';
import 'package:dictionary_clean/feature/feature_dictionary/domain/usecases/dictionary_search_usecase.dart';
import 'package:dictionary_clean/feature/feature_dictionary/presentation/bloc/sw_status.dart';
import 'package:flutter/material.dart';

part 'dictionary_event.dart';
part 'dictionary_state.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  final DictionarySearchUseCase dictionarySearchUseCase;

  DictionaryBloc(this.dictionarySearchUseCase) : super(DictionaryState(swStatus: SwLoading())) {


    on<LoadSWEvent>((event, emit) async{
      emit(state.copyWith(newSwStatus: SwLoading()));
      DataState dataState = await dictionarySearchUseCase(event.word);
      if(dataState is DataSuccess){
        emit(state.copyWith(newSwStatus: SwCompleted(dataState.data)));
      }
      if(dataState is DataFailed){
        emit(state.copyWith(newSwStatus: SwError(dataState.error??"")));
      }


    });
  }
}
