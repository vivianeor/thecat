import 'package:flutter/material.dart';
import 'package:thecat_app/model/breeds_model.dart';

class PageDescription extends StatefulWidget {

  BreedsModel breed;

  PageDescription(this.breed);

  @override
  _PageDescriptionState createState() => _PageDescriptionState();
}

class _PageDescriptionState extends State<PageDescription> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da raça:'),
        backgroundColor: Colors.black,
      ),
        body: Container(
            margin: EdgeInsets.all(30),

              child: Column(
                children:[
                  Text(widget.breed.name),
                  Image.network(widget.breed.image.url),
                  Text(widget.breed.temperament),
                  Text(widget.breed.origin),
                  Text(widget.breed.description),
                  Text(widget.breed.energyLevel),
                  Text(widget.breed.intelligence),
                  Text(widget.breed.wikipediaUrl),
                  Text(widget.breed.referenceImageId),
                ],
          ),
        ),
    );
  }
}
