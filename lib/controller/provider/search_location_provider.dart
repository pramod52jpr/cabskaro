import 'package:flutter/foundation.dart';

class SearchStartLocationModel extends ChangeNotifier {
  String _sessionToken = "";
  List<dynamic> data = [];
  String get sessionToken => _sessionToken;

  void setSessionToken(String sessionToken) {
    _sessionToken = sessionToken;
    notifyListeners();
  }

  void setData(List<dynamic> newData) {
    data = newData;
    notifyListeners();
  }
}
