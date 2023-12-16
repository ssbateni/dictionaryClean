import 'package:dictionary_clean/feature/feature_dictionary/data/models/dictionary_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefinitionsView extends StatelessWidget {
  Meanings meaning;
   DefinitionsView( {required this.meaning,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text("DEFINITIONS",style: GoogleFonts.aBeeZee(
            fontWeight:FontWeight.w800 ,
            fontSize: 20,
            color: Colors.black,
        ),
    ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items(),
        )

      ],
    );
  }

  List<Widget> items() {
    List<Widget> widgets = [];
    int length = (meaning.definitions?.length??0)>3 ?3:(meaning.definitions?.length??0);

    for(int i = 0; i<length; i++){
      widgets.add(
        Padding(padding: EdgeInsets.symmetric(vertical: 3),
        child:   Text.rich(

          TextSpan(
            children: [
              TextSpan(text: "${i+1}. ",style: const TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold)),
              TextSpan(text: meaning.definitions?[i].definition??"",style: const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400)),
            ],
          ),
        ),
        )
      );
    }
    return widgets;
  }
}
