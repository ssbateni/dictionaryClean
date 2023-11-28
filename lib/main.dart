import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(background: Colors.grey.shade100)
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 32,horizontal: 16),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Dictionary",
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.black,
              ),),
              const SizedBox(height: 15,),
              TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide.none
                  ),
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  prefixIcon: Icon(Icons.search,color: Colors.blueGrey,),
                  hintText: "search here",
                  hintStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black87)
                ),

              ),
              const SizedBox(height: 15,),
              const Text("Recent",
                style: TextStyle(fontSize: 25,color: Colors.black,
                ),),
              Column(
                children: recentItem(),
              )



            ],
          ),
        )
    ));
  }

  List <Widget> recentItem() {
    List <Widget> items = [];
    for(int i=0 ; i<10;i++){
      items.add(Text("data",style: TextStyle(
        color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400
      ),),);
    }
    return items;
  }
}



