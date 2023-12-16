import 'package:dictionary_clean/feature/feature_dictionary/data/models/dictionary_model.dart';
import 'package:dictionary_clean/feature/feature_dictionary/domain/entities/dictionary_entity.dart';
import 'package:dictionary_clean/feature/feature_dictionary/presentation/bloc/dictionary_bloc.dart';
import 'package:dictionary_clean/feature/feature_dictionary/presentation/bloc/sw_status.dart';
import 'package:dictionary_clean/feature/feature_dictionary/presentation/screens/example_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import 'definitions_view.dart';
import 'sa_view.dart';

class DictionaryResult extends StatefulWidget {
  final String word;
  const DictionaryResult({super.key,required this.word});

  @override
  State<DictionaryResult> createState() => _DictionaryResultState();
}

class _DictionaryResultState extends State<DictionaryResult> {
  late final String word;
  @override
  void initState() {
    word = widget.word;
    super.initState();
    BlocProvider.of<DictionaryBloc>(context).add(LoadSWEvent(word));
  }


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
            body:
            BlocBuilder<DictionaryBloc,DictionaryState>(
                builder: (context,state){
                  if(state.swStatus is SwLoading){
                    return const Center(child: CircularProgressIndicator(color: Colors.blue),);
                  }
                  if(state.swStatus is SwCompleted){
                    final SwCompleted swCompleted = state.swStatus as SwCompleted;
                    final DictionaryEntity dictionaryEntity = swCompleted.dictionaryEntity;
                    return  Description(dictionaryEntity: dictionaryEntity);
                  }
                  if(state.swStatus is SwError){
                    return const Text("Error");}
                  return Container();
                })

        ));
  }

}


class Description extends StatefulWidget{
  final DictionaryEntity dictionaryEntity;
  Description({super.key, required this.dictionaryEntity});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  final AudioPlayer player = AudioPlayer();
  late DictionaryEntity dictionaryEntity;
  int meaningsIndex = 0;
  // player.playerStateStream.listen((state) {
  // if (state.processingState == ProcessingState.completed) {
  // onComplete();
  // }
  // });
  String playerState = "";
  @override
  void initState() {

    dictionaryEntity = widget.dictionaryEntity;
    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {print("ProcessingState.completed");}
      if (state.processingState == ProcessingState.loading) {print("ProcessingState.loading");}
      if (state.processingState == ProcessingState.buffering) {print("ProcessingState.buffering");}
      if (state.processingState == ProcessingState.ready) {print("ProcessingState.ready");}
      if (state.processingState == ProcessingState.idle) {print("ProcessingState.idle");}
      setState(() {
        playerState = state.processingState.name;
      });
      // }
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return   SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: (){},
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chevron_left_rounded,color: Colors.blue,size: 40,
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 3),
                          child: Text("Search",style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue,fontSize: 20),)
                      ) ,
                    ],
                  )
              ),
              const SizedBox(height: 20,),
              Text(dictionaryEntity.word??"",
                style: const TextStyle(color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,),
              ),
              const SizedBox(height: 5,),
              Row(
                  children: (dictionaryEntity.phonetics??[]).map((item) =>
                  item.text==null
                      ? Container()
                      : Row(
                        children: [
                          Text(item.text.toString(),
                            style: const TextStyle(color: Colors.blue,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,),
                          ),
                          item.audio?.isEmpty??true
                              ? Container()
                              : IconButton(onPressed: () => _play(item.audio!),
                            icon: const Icon(Icons.volume_up_rounded,size: 25, color:
                            Colors.blue,), ),
                          const SizedBox(width: 10,)
                        ],
                      )
                  ).toList()

              ),
              const SizedBox(height: 20,),
              partOfSpeechSelection(dictionaryEntity.meanings??[]),
              const SizedBox(height: 20),
             if(dictionaryEntity.meanings != null) DefinitionsView(meaning: dictionaryEntity.meanings![meaningsIndex]),
              const SizedBox(height: 20),
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 if(dictionaryEntity.meanings != null) SAView(title: "SYNONYMS",meaning: dictionaryEntity.meanings![meaningsIndex]),
                 if(dictionaryEntity.meanings != null) SAView(title: "ANTONYMS" ,meaning: dictionaryEntity.meanings![meaningsIndex]),
               ],
             ),
              const SizedBox(height: 20),
              if(dictionaryEntity.meanings != null) ExampleView(meaning: dictionaryEntity.meanings![meaningsIndex]),

            ]));

  }

  void _play(String audio) async {

    await player.setUrl(audio);
    player.play();

    // final audioSource = LockCachingAudioSource(Uri.parse(audio));
    // await player.setAudioSource(audioSource);
    // player.play();
  }

  Widget partOfSpeechSelection(List<Meanings> meanings) {

    final children = {
      for (final item in meanings)
        meanings.indexOf(item): Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            item.partOfSpeech??"",
            style: TextStyle(
              color: meanings[meaningsIndex] == item ? Colors.white : Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
    };
    return Container(
      child: CupertinoSegmentedControl<int>(
        padding: EdgeInsets.zero,
       onValueChanged:(int value){
         setState(() {
           meaningsIndex = value;
         });
       } ,
        children:children ,
        selectedColor: Colors.blue,
        borderColor: Colors.blue,
        groupValue:meaningsIndex ,
        unselectedColor: Colors.transparent,

      ),
    );

  }
  
}

