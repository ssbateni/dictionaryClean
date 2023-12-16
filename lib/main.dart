import 'package:dictionary_clean/feature/feature_dictionary/domain/usecases/dictionary_search_usecase.dart';
import 'package:dictionary_clean/feature/feature_dictionary/presentation/bloc/dictionary_bloc.dart';
import 'package:dictionary_clean/feature/feature_dictionary/presentation/screens/dictionary_result.dart';
import 'package:dictionary_clean/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'feature/feature_recent/presentation/screens/my_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///init locator
  await setup();



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => locator<DictionaryBloc>()),
        ],

        child:MaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'Dictionary',
          theme: ThemeData(
              useMaterial3: true,
              textTheme: GoogleFonts.poppinsTextTheme(),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
                  .copyWith(background: Colors.grey.shade100)),
          home: const SelectionArea(child:  MyHomePage()),
      ),
    );
  }
}



