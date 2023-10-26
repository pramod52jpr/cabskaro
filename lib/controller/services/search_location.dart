import 'dart:convert';
import 'package:cabskaro/controller/provider/search_location_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;


class SearchStartLocationFuntion{
  
void onChange(String input, SearchStartLocationModel model) async {
    String? googleApiKey = dotenv.env['APIurl'];
    String baseUrl =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json";
    String request =
        "$baseUrl?input=$input&key=$googleApiKey&sessiontoken=${model.sessionToken}";
    http.Response response;
    response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      model.setData(jsonDecode(response.body)["predictions"]);
    } else {
      throw Exception("there is an error");
    }
  }
}


  