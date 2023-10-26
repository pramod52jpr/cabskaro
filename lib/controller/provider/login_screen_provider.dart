import 'package:flutter/material.dart';

class LoginScreenProvider extends ChangeNotifier {

  var _opacity=0.0;

  get opacity=>_opacity;

  void updateOpacity(dynamic opacityvalue) {
    _opacity=opacityvalue;
    notifyListeners();

  }
}