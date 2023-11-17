import 'dart:convert';
import 'package:cabskaro/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsApiProvider extends ChangeNotifier{
  final apiUrl='https://newsapi.org/v2/everything?q=keyword&apiKey=725f2bf9fb734e3880fe27aa3d730449';

  List<ArticleModel> _news = [];
  List<ArticleModel> get news => _news;
  List<Source> _newssource = [];
  List<Source> get newssource => _newssource;


Future<void> getNewsData() async {
  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      dynamic jsonData = jsonDecode(response.body);

      if (jsonData is List) {
        List<ArticleModel> fetchedNews =
            jsonData.map((item) => ArticleModel.fromJson(item)).toList();
        _news = fetchedNews;
        notifyListeners();
      } else if (jsonData is Map && jsonData.containsKey("articles")) {
        List<ArticleModel> fetchedNews = (jsonData["articles"] as List)
            .map((item) => ArticleModel.fromJson(item))
            .toList();
        _news = fetchedNews;
        notifyListeners();
      } else {
        throw Exception('Invalid data format');
      }
    } else {
      throw Exception('Failed to load news data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
  }
}

Future<void> getNewsDataSourse()async{
final response=await http.get(Uri.parse(apiUrl));

if(response.statusCode==200){
  List<dynamic> jsonData = jsonDecode(response.body);
  List<Source> fetchedNewsSource = jsonData.map((item) => Source.fromJson(item)).toList();
_newssource=fetchedNewsSource;
notifyListeners();
  }
  else {
  throw Exception('Failed to load albums');
  }  
  } 
}