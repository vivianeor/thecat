import 'dart:convert';
import 'package:thecat_app/model/breeds_model.dart';
import 'package:http/http.dart' as http;

const String randomBreedsURL = 'https://api.thecatapi.com/v1/breeds/';

class BreedsNetworkService{

  String _search;

  String _offset;

  Map<String, String> headers = {
    'x-api-key' : '98c1a2e3-b032-4205-9261-46233cb892f7',
  };

  Future<List<BreedsModel>> fetchBreeds() async {
    http.Response response ;

    if (response.statusCode == 200){
      response = await http.get('https://api.thecatapi.com/v1/breeds', headers: headers);
      final Map breedsData = jsonDecode(response.body) as Map<String, dynamic>;
      List<Map<String, dynamic>> breeds = breedsData['results'] as List<Map<String, dynamic>>;
      return breeds.map((json) => BreedsModel.fromJson(json)).toList();

    } else if(_search == _offset){
      response = await http.get('https://api.thecatapi.com/v1/breeds/$_search?q=?$_offset', headers: headers);
      final Map breedsData = jsonDecode(response.body) as Map<String, dynamic>;
      List<Map<String, dynamic>> breeds = breedsData['results'] as List<Map<String, dynamic>>;
      return breeds.map((json) => BreedsModel.fromJson(json)).toList();

    }else
      throw Exception('Erro, ${response.statusCode}');


  }
}









/*   COMO ESTAVA:
const String randomBreedsURL = 'https://api.thecatapi.com/v1/breeds/';

class BreedsNetworkService{

  Map <String, String> headers = {
    'x-api-key' : '98c1a2e3-b032-4205-9261-46233cb892f7',
  };

  Future<List<BreedsModel>> fetchBreeds(int amount) async {
    http.Response response = await http.get('$randomBreedsURL?search?q=$amount', headers: headers);

    if (response.statusCode == 200){
      Map<String, dynamic> breedsData = jsonDecode(response.body) as Map<String, dynamic>;
      List<Map<String, dynamic>> breeds = breedsData['results'] as List<Map<String, dynamic>>;
      return breeds.map((json) => BreedsModel.fromJson(json)).toList();
    } else{
      throw Exception('Erro, ${response.statusCode}');
    }

  }
}
 */