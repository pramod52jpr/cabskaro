import 'package:flutter/material.dart';

class HistoryScreenProvider extends ChangeNotifier{
 double userRating = 0;

  void updateUserRating(double newRating) {
  userRating = newRating;
  notifyListeners();
  }
}