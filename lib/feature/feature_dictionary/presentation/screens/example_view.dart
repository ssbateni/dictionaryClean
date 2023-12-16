import 'package:dictionary_clean/feature/feature_dictionary/data/models/dictionary_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExampleView extends StatelessWidget {
   final Meanings meaning;
   const ExampleView( {required this.meaning,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text("EXAMPLE",style: GoogleFonts.aBeeZee(
            fontWeight:FontWeight.w800 ,
            fontSize: 20,
            color: Colors.black,
        )),
             Text(exampleStr(),
                 style: const TextStyle(
                     color: Colors.blue,
                     fontSize: 15,
                     fontWeight: FontWeight.w400))


      ],
    );
  }

  String exampleStr() {

    String example = "-";
    for(int i = 0; i<(meaning.definitions?.length??0); i++){
      print("exampleStr123456  ${(meaning.definitions?[i].example??"")}");
      if ((meaning.definitions?[i].example??"").isNotEmpty) {
        example = meaning.definitions?[i].example??"";
        return example;}
    }
    return example;
  }
}
