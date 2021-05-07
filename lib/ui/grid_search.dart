import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:thecat_app/bloc/breeds_bloc.dart';
import 'package:thecat_app/http/breeds_http.dart';
import 'package:thecat_app/model/breeds_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/src/widgets/image.dart' as img;
import 'package:google_fonts/google_fonts.dart';
import 'package:thecat_app/ui/page_description.dart';

class GridSearch extends StatefulWidget {
  final Breed breed;
  GridSearch({
    Key key,
    this.breed,
  }) : super(key: key);

  @override
  _GridSearchState createState() => _GridSearchState();
}

class _GridSearchState extends State<GridSearch> {
  Breed breed;
  List<Breed> breeds = List<Breed>();
  BreedsBloc bloc = BreedsBloc();
  BreedsHttp breedsHttp = BreedsHttp();
  String search;
  int offset = 0;

  @override
  void initState() {
    bloc.getBreeds();
    bloc.getSearch(search);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: false,
        right: false,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Pesquise aqui",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()
                    ),
                    style: GoogleFonts.mcLaren(textStyle: TextStyle(fontSize: 15)),
                    textAlign: TextAlign.center,
                    onSubmitted: (text){
                      setState(() {
                        search = text;
                      });
                    },
                  )
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                StreamBuilder<List<Breed>>(
                    stream: bloc.breedsStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Icon(MdiIcons.reload);
                      }
                      if (snapshot.hasData) {
                        var breed = snapshot.data;
                        return GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 20,
                              crossAxisCount: 2,
                            ),
                            shrinkWrap: true,
                            itemCount: breed.length,
                            itemBuilder: (context, index) {
                              var imageUrl = breed[index].image?.url;
                              var name = breed[index].name;
                              return Container(
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () => _goToPageDescription(context, breed[index]),
                                      child: Container(
                                        height: 130,
                                        width: 150,
                                        child:
                                        imageUrl == null ? Container() :
                                        img.Image.network(
                                          imageUrl,
                                          fit: BoxFit.cover,
                                        )
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 2),
                                      child: Text(
                                        name,
                                        style: GoogleFonts.mcLaren(
                                          textStyle: TextStyle(
                                              fontSize: 15
                                          )
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                        );
                      }
                    return _connectionState();
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _goToPageDescription(BuildContext context, Breed breed) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PageDescription(breed: breed)));
  }

  Widget _connectionState() {
    return FutureBuilder(
      future: bloc.getBreeds(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 120, vertical: 120),
              width: 50,
              height: 50,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                strokeWidth: 5,
              ),
            );
          default:
            return Container();
        }},
    );
  }


  List<Breed> _filterBreeds(String text) {
    var search = text.trim();
    var breed = List<Breed>.from(breeds
        .where((element) =>
            element.name.toUpperCase().contains(search.toUpperCase()))
        .toList());
    return breed;
  }
}
