import 'package:dictionary_clean/feature/feature_dictionary/domain/entities/dictionary_entity.dart';
import 'package:dictionary_clean/feature/feature_dictionary/presentation/bloc/dictionary_bloc.dart';
import 'package:dictionary_clean/feature/feature_dictionary/presentation/bloc/sw_status.dart';
import 'package:dictionary_clean/feature/feature_dictionary/presentation/screens/dictionary_result.dart';
import 'package:dictionary_clean/feature/feature_recent/domain/usecases/get_suggestion_word_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../locator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();
  GetSuggestionWordUseCase getSuggestionWordUseCase =
      GetSuggestionWordUseCase(locator());

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<DictionaryBloc>(context).add(LoadSWEvent("word"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BlocBuilder<DictionaryBloc, DictionaryState>(
          //     builder: (context, state) {
          //   if (state.swStatus is SwLoading) {
          //     return const CircularProgressIndicator();
          //   }
          //   if (state.swStatus is SwCompleted) {
          //     final SwCompleted swCompleted = state.swStatus as SwCompleted;
          //     final DictionaryEntity dictionaryEntity =
          //         swCompleted.dictionaryEntity;
          //     return Text(dictionaryEntity.origin ?? "");
          //   }
          //   if (state.swStatus is SwError) {
          //     return const Text("Error");
          //   }
          //   return Container();
          // }),
          const Text(
            "Dictionary",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TypeAheadField<String>(
            builder: (context, controller, focusNode) {
              return TextField(
                controller: controller,
                focusNode: focusNode,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.zero,
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.blueGrey,
                    ),
                    hintText: "search here",
                    hintStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87)),
              );
            },
            controller: textEditingController,
            suggestionsCallback: (String prefix) {
              return getSuggestionWordUseCase(prefix);
            },
            itemBuilder: (context, String model) {
              return ListTile(
                title: Text(model),
              );
            },
            onSelected: (String value) {
              textEditingController.text = value;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  DictionaryResult(word: value)),
              );

                  // BlocProvider.of<HomeBloc>(context).add(LoadCwEvent(model.name!));
            },
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Recent",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          Column(
            children: recentItem(),
          )
        ],
      ),
    )));
  }

  List<Widget> recentItem() {
    List<Widget> items = [];
    for (int i = 0; i < 10; i++) {
      items.add(
        const Text(
          "data",
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      );
    }
    return items;
  }
}
