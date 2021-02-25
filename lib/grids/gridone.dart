import 'package:flutter/material.dart';
import 'package:thecat_app/description/page_description.dart';
import 'package:thecat_app/model/breeds_model.dart';
import 'package:thecat_app/services/breeds_network_services.dart';

class GridOne extends StatefulWidget {
  @override
  _GridOneState createState() => _GridOneState();
}

class _GridOneState extends State<GridOne> {
  BreedsNetworkService breedsService = BreedsNetworkService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        children: [
          Expanded(
              child:
              SizedBox(
                height: 300.0,
                child: FutureBuilder<List<BreedsModel>>(
                  future: breedsService.fetchBreeds(),
                  builder: (context, snapshot){
                    switch(snapshot.connectionState){
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return Container(
                            width: 200.0,
                            height: 200.0,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                              strokeWidth: 5.0,
                            )
                        );
                      default:
                        if(snapshot.hasError) return Container();
                        else return _createImageTable(context, snapshot.data);
                    }
                   },
                  ),
               ),
             ),
           ],
         ),
       );
     }

  Widget _createImageTable(BuildContext context, List<BreedsModel> breeds){
    return GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(2.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 100.0,
              mainAxisSpacing: 100.0,
            ),
            itemCount: breeds.length,                      //pega quantas imagens tem na api
            itemBuilder: (context, index){                            //isso aqui é como se fosse um for / index é p indice
              return GestureDetector(                                     //clicar na imagem
                child:
                Image.network(breeds[index].image.url,
                  height: 300.0,
                  fit: BoxFit.cover,),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute<void>(builder: (context) => PageDescription(breeds[index])));
                  },
              );
            }
          );
        }
      }
