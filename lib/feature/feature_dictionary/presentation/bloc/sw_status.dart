import 'package:dictionary_clean/feature/feature_dictionary/domain/entities/dictionary_entity.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SwStatus{}

class SwLoading extends SwStatus{}

class SwCompleted extends SwStatus{
  final  DictionaryEntity dictionaryEntity;
  SwCompleted(this.dictionaryEntity);
}

class SwError extends SwStatus{
  final String message;
  SwError(this.message);
}
