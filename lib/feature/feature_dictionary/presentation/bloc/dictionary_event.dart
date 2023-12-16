part of 'dictionary_bloc.dart';

@immutable
abstract class DictionaryEvent {}
 
class LoadSWEvent extends DictionaryEvent{
  final String word;
  LoadSWEvent(this.word);
}
