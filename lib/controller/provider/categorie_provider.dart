import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class RecommendationProvider with ChangeNotifier {
  List _extractedData = [];
  bool _loading = false;
  bool _allData = true;

  List get extractedData => _extractedData;
  bool get loading => _loading;
  bool get allData => _allData;

  Future<void> showRecommendationTypes(double latitude, double longitude, List<String> type) async {
    _extractedData = [];
    _loading = true;
    _allData = false;
    notifyListeners();

    String? apiKey = dotenv.env['APIurl'];
    int radius = 10000;

    for (var element in type) {
      String url =
          "https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=$apiKey&location=$latitude,$longitude&radius=$radius&type=$element";
      Response response = await get(Uri.parse(url));
      List data = jsonDecode(response.body)["results"];
      for (var e in data) {
        e.putIfAbsent("category", () => element);
      }
      _extractedData.addAll(data);
      print(url);
    }

    _loading = false;
    notifyListeners();
  }

  void resetData() {
    _extractedData = [];
    _allData = true;
    notifyListeners();
  }
}

class CategoryProvider with ChangeNotifier {
  String _selectedCategory = "";

  String get selectedCategory => _selectedCategory;

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}