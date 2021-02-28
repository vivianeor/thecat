import 'package:flutter/material.dart';
import 'package:thecat_app/services/breeds_network_services.dart';
import '../grids/gridone.dart' as gridone;
import '../grids/gridtwo.dart' as gridtwo;
import '../services/breeds_network_services.dart' as breeds;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  final BreedsNetworkService breedsService = BreedsNetworkService();

  TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
    breeds.BreedsNetworkService();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('The Cat'),
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
              // Icon(Icons.home),
              // Icon(Icons.access_time),
              gridone.GridOne(),
              gridtwo.GridTwo(),
            ]
          ),
     );
   }
}