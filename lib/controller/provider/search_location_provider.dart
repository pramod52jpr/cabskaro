import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class SearchStartLocationProvider extends ChangeNotifier{
final TextEditingController searchController=TextEditingController();
var uuid=const Uuid();
String _sessionToken="";
List<dynamic>data=[];

void onChange(String input)async {
  _sessionToken=uuid.v4();
  String?googleApiKey=dotenv.env['APIurl'];
  String?baseurl="https://maps.googleapis.com/maps/api/place/autocomplete/json";
  String request =
        "$baseurl?input=$input&key=$googleApiKey&sessiontoken=$_sessionToken";
http.Response response;
response=await http.get(Uri.parse(request));
if(response.statusCode==200){
  data=jsonDecode(response.body)["predictions"];
}
else{
  throw Exception("there is an error");
}
notifyListeners();
 }
}