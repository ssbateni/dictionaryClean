
import 'package:equatable/equatable.dart';

class SuggestWordEntity extends Equatable {
  final String? word;
  final int? score;

  const SuggestWordEntity({this.word, this.score});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}