import 'dart:async';
import 'dart:convert';
import 'package:thecat_app/http/breeds_http.dart';
import 'package:thecat_app/model/breeds_model.dart';

class BreedsBloc{
  Breed breed = Breed();
  List<Breed> breeds = List<Breed>();
  final _breedsHistoryController = StreamController<List<Breed>>.broadcast();
  Stream<List<Breed>> get breedsStream => _breedsHistoryController.stream;

  List<Breed> originalBreeds = List<Breed>();
  List<Breed> firstFilteredBreeds = List<Breed>();

  BreedsHttp _breedsHttp = BreedsHttp();

  Future<List<Breed>> getBreeds() async{
    try{
      var result = await _breedsHttp.getAll();
      var utf8Body = utf8.decode(result.bodyBytes);
      if(result.statusCode == 200){
        var json = jsonDecode(utf8Body);
        var breed = BreedsList.fromJson(json);
        breeds = breed.values;
        _breedsHistoryController.sink.add(breed.values);
        return breed.values;
      }else{
        var exception = Exception("error!!!");
        _breedsHistoryController.sink.addError(exception);
        throw exception;
      }
    } on Exception catch(e){
      _breedsHistoryController.sink.addError(e);
      throw e;
    }
  }

  Future<List<Breed>> getSearch(String search) async{
    try{
      var result = await _breedsHttp.getSearch(search);
      var utf8Body = utf8.decode(result.bodyBytes);
      if(result.statusCode == 200){
        var json = jsonDecode(utf8Body);
        var breed = BreedsList.fromJson(json);
        breeds = breed.values;
        _breedsHistoryController.sink.add(breed.values);
        return breed.values;
      }else{
        var exception = Exception("error!!!");
        _breedsHistoryController.sink.addError(exception);
        throw exception;
      }
    } on Exception catch(e){
      _breedsHistoryController.sink.addError(e);
      throw e;
    }
  }

  void dispose(){
    _breedsHistoryController.close();
  }

}