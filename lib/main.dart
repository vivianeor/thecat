import 'package:flutter/material.dart';
import 'home/Home.dart';


void main() {
    runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'The Cats Demo',
        // theme: ThemeData(
        //     primarySwatch: Colors.white,
        // ),
        home: Home(),
    );
  }
}

