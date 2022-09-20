import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp/providers/providers.dart';
import 'package:sp/screens/screes.dart';


void main() => runApp(AppState());

class AppState extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>ProductProvider(), lazy: false,),
      
    ],
    child: MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicattion',
      initialRoute: 'home',
      routes: {
        'home'    : (_)=> HomeScreen(),
        'details' : (_)=>DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          toolbarHeight: 70,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
        scaffoldBackgroundColor: Colors.white
      ),
    );
  }
}