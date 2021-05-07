import 'package:flutter/material.dart';
import 'package:thecat_app/http/breeds_http.dart';
import 'grid_images_cats.dart' as gridone;
import 'grid_search.dart' as gridtwo;
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  final BreedsHttp breedsHttp = BreedsHttp();

  TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'The Cat',
            style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                    fontSize: 25
                )
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            controller: controller,
            indicatorWeight: 5.0,
            indicatorColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.face),),
              Tab(icon: Icon(Icons.search),)
            ],
          ),
        ),
        body: TabBarView(
              controller: controller,
              children: [
                gridone.GridImagesCats(),
                gridtwo.GridSearch(),
              ]
            ),
       ),
    );
   }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}