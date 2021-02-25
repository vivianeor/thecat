import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:thecat_app/description/page_description.dart';
import 'package:thecat_app/model/breeds_model.dart';
import 'package:thecat_app/services/breeds_network_services.dart';

class GridTwo extends StatefulWidget {
  @override
  _GridTwoState createState() => _GridTwoState();
}

class _GridTwoState extends State<GridTwo> {

  BreedsNetworkService breedsService = BreedsNetworkService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Pesquise Aqui!",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder()
                ),
                style: TextStyle(color: Colors.white, fontSize: 18.0),
                textAlign: TextAlign.center,
                // onSubmitted: (text){
                //   setState(() {
                //     _search = text;
                //     _offset = 0;
                //   });
                // },
              ),
             ),
            Expanded(
                child: FutureBuilder<List<BreedsModel>>(
                  future: breedsService.fetchBreeds(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return Container(
                            width: 200.0,
                            height: 200.0,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.black),
                              strokeWidth: 5.0,
                            )
                        );
                      default:
                        if (snapshot.hasError)
                          return Container();
                        else
                          return _createImageTable(context, snapshot.data);
                }
              },
            ),
         )
       ],
      ),
    );
  }

  Widget _createImageTable(BuildContext context, List<BreedsModel> breeds) {
    // return Container();
    return GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(2.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: breeds.length, //pega quantas imagens tem na api
        itemBuilder: (context, index) {
          return GestureDetector( //clicar na imagem
            child: Image.network(breeds[index].image.url,
              height: 300.0,
              fit: BoxFit.cover,),
            onTap: () {
              Navigator.push(context, MaterialPageRoute<void>(
                  builder: (context) => PageDescription(breeds[index])));
            },
          );
        }
    );
  }
}