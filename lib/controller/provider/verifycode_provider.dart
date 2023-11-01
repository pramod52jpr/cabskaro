import 'package:flutter/foundation.dart';

class VerifyCodeProvider extends ChangeNotifier {
  int _time = 59;
  int get time => _time;
  
  void setInitialTime() {
    _time = 60;
    notifyListeners();
  }

  void setTime() {
    if (_time > 0) {
      _time--;
    }
    notifyListeners();
  }
}
