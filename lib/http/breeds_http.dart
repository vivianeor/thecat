import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BreedsHttp{
  var response;
  var url = 'https://api.thecatapi.com/v1';

  Map<String, String> headers = {
    'x-api-key' : '30d2f8a2-0327-4973-87bd-fd1fe9814658',
  };

  Future<Response> getAll() async{
    try {
      response = await http.get("$url/breeds/", headers: headers);
      print(response.body);
      return response;
    } on Exception catch(e){
      print(e);
      throw e;
    }
  }
  
  Future<Response> getSearch(String search) async{
    try {
        response = await http.get("$url/images/search?breed_ids=$search", headers: headers);
      return response;
    }on Exception catch(e) {
      print(e);
      throw e;
    }
}

}
