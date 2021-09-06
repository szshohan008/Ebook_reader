import 'package:ebook_reader/view/Home/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
 class MyApp extends StatelessWidget {

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Ebook Reader',

       theme: ThemeData(
         primarySwatch: Colors.blue,
       ),
       home: HomePage(),
     );
   }
 }

