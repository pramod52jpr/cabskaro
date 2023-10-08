import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class SearchLocation extends StatefulWidget {
  const SearchLocation({super.key});

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  TextEditingController _searchController=TextEditingController();
  var uuid=Uuid();
  String _sessionToken="123456";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  _searchController.addListener(() {
    onChange();
  });
  }

  void onChange(){
    if(_sessionToken==null){
      setState(() {
        _sessionToken=uuid.v4();
      });
      getSuggestion(_searchController.text);
    }
  }

  void getSuggestion(String input)async{
    String google_api_key="AIzaSyCO_wfyG_EXNah7CsXjhdIxKRNKeqigU1Q";
    String baseUrl="https://maps.google.com/maps/api/place/autocomplete/json";
    String request="$baseUrl?input=$input&key=$google_api_key&sessiontoken=$_sessionToken";
    
    http.Response response;
    response=await http.get(Uri.parse(request));
    var data=jsonDecode(response.body);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                  prefixIcon: InkWell(
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  contentPadding: EdgeInsets.zero,
                  hintText: "Search Here",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.grey, width: 1))),
            )
          ],
        ),
      ),
    );
  }
}
