import 'package:flutter/material.dart';
import 'package:thecat_app/ui/home_page.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Cats',
      home: HomePage(),
    );
  }
}

