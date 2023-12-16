import 'package:dictionary_clean/feature/feature_dictionary/data/models/dictionary_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SAView extends StatelessWidget {
  final Meanings meaning;
  final String title;

  const SAView({required this.title, required this.meaning, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.aBeeZee(
            fontWeight: FontWeight.w800,
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
    ));
  }

  List<Widget> items() {
    List<Widget> widgets = [];
    List<String> strList = title.contains("SYNONYMS")
        ? meaning.synonyms ?? []
        : meaning.antonyms ?? [];
    int length = (strList.length) > 5 ? 5 : (strList.length);

    for (int i = 0; i < length; i++) {
      widgets.add(Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Text(strList[i],
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.w400))));
    }
    if (length == 0) {
      widgets.add( const Text(
          "---",
          style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w400)),);
    }
    return widgets;
  }
}
