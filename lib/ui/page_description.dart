import 'package:flutter/material.dart';
import 'package:thecat_app/bloc/breeds_bloc.dart';
import 'package:thecat_app/http/breeds_http.dart';
import 'package:thecat_app/model/breeds_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/image.dart' as img;

class PageDescription extends StatefulWidget {
  final Breed breed;
  PageDescription({
    this.breed,
  });
  @override
  _PageDescriptionState createState() => _PageDescriptionState();
}

class _PageDescriptionState extends State<PageDescription> {
  BreedsHttp breedsHttp = BreedsHttp();
  BreedsBloc bloc = BreedsBloc();

  @override
  void initState() {
    bloc.getBreeds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Detalhes da raça',
            style: GoogleFonts.mcLaren(
                textStyle: TextStyle(
                    fontSize: 18
                )
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: ${widget.breed.name}\n",
                  style: GoogleFonts.mcLaren(
                    textStyle: TextStyle(
                      fontSize: 15
                    )
                  ),
                ),
                Text(
                  "Temperament: ${widget.breed.temperament}\n",
                  style: GoogleFonts.mcLaren(
                    textStyle: TextStyle(
                        fontSize: 15
                    )
                  ),
                ),
                Text(
                  "Origin: ${widget.breed.origin}\n",
                  style: GoogleFonts.mcLaren(
                    textStyle: TextStyle(
                        fontSize: 15
                    )
                  ),
                ),
                Text(
                  "Rare: ${widget.breed.rare}\n".toString(),
                  style: GoogleFonts.mcLaren(
                    textStyle: TextStyle(
                        fontSize: 15
                    )
                  ),
                ),
                Text(
                    "Adaptability: ${widget.breed.adaptability}\n".toString(),
                  style: GoogleFonts.mcLaren(
                      textStyle: TextStyle(
                          fontSize: 15
                      )
                  ),
                ),
                Text(
                  "Intelligence: ${widget.breed.intelligence}\n".toString(),
                  style: GoogleFonts.mcLaren(
                    textStyle: TextStyle(
                        fontSize: 15
                    )
                  ),
                ),
                Text(
                  "Description: ${widget.breed.description}\n",
                  style: GoogleFonts.mcLaren(
                      textStyle: TextStyle(
                        fontSize: 15
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: widget.breed.image.url == null ? Container () :
                    img.Image.network(
                      widget.breed.image.url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ]
            ),
          ),
        )
      )
    );
  }
}
