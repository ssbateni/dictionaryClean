part of 'dictionary_bloc.dart';

class DictionaryState{
  SwStatus swStatus;

  DictionaryState({required this.swStatus});

  DictionaryState copyWith({
    SwStatus? newSwStatus // اگر نخواهیم تغییراتی را اعمال کنیم و در حالت استاتوس قیلی بمانیم پس در نتیجه باید فیلد های خود را nullale تعریف کنیم
  }){
    return DictionaryState(
        swStatus: newSwStatus??swStatus);
  }
}