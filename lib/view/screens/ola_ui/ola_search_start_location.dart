import 'dart:convert';

import 'package:cabskaro/view/screens/ola_ui/ola_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class OlaSearchStartLocation extends StatefulWidget {
  const OlaSearchStartLocation({super.key});

  @override
  State<OlaSearchStartLocation> createState() => _OlaSearchStartLocationState();
}

class _OlaSearchStartLocationState extends State<OlaSearchStartLocation> {
  final TextEditingController _searchController = TextEditingController();
  var uuid = const Uuid();
  String _sessionToken = "";
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      onChange(_searchController.text.toString());
    });
  }

  void onChange(String input) async {
    setState(() {
      _sessionToken = uuid.v4();
    });
    String googleApiKey = "AIzaSyA0r0oRC03tITR0FNYVfKT-SlXEvf_FDp0";
    String baseUrl =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json";
    String request =
        "$baseUrl?input=$input&key=$googleApiKey&sessiontoken=$_sessionToken";
    http.Response response;
    response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body)["predictions"];
      });
    } else {
      throw Exception("there is an error");
    }
  }

  void getSuggestion(String input) async {}

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(height: 45),
              Hero(
                tag:"start",
                child: Material(
                  child: TextFormField(
                    controller: _searchController,
                    autofocus: true,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      prefixIcon: InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.arrow_back, color: Colors.grey),
                      ),
                      contentPadding: EdgeInsets.zero,
                      hintText: "Search Here",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: data.isEmpty
                    ?  ListTile(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const OlaScreen(
                                      location: "current",
                                      locType: "start",
                                    ),
                                  ));
                            },
                            contentPadding: EdgeInsets.zero,
                            leading: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: FaIcon(FontAwesomeIcons.locationCrosshairs),
                            ),
                            title: const Text("Current Location"),
                          )
                    : ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OlaScreen(
                                      location: data[index]['description'],
                                      locType: "start",
                                    ),
                                  ));
                            },
                            contentPadding: EdgeInsets.zero,
                            title: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(data[index]['description']),
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
