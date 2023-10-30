import 'package:flutter/material.dart';

class SplashScreenProvider extends ChangeNotifier{

  bool _firstAnimation = false;
  bool _splashAnimation = false;
  bool _secondAnimation = false;
  var _btnOpacity = 0.0;
  var _opacity = 0.0;
  var _ropeOpacity = 1.0;

  bool get firstAnimation=>_firstAnimation;
  bool get splashAnimation=>_splashAnimation;
  bool get secondAnimation=>_secondAnimation;
  get btnOpacity=>_btnOpacity;
  get opacity=>_opacity;
  get ropeOpacity=>_ropeOpacity;

  void firstAnimations(bool value){
  _firstAnimation=value;
  notifyListeners();
}

  void splashAnimations(bool value){
  _splashAnimation=value;
  notifyListeners();
  }

  void secondAnimations(bool value){
  _secondAnimation=value;
  notifyListeners();
  }

  void btnOpacitys(dynamic btnOpacity){
  _btnOpacity=btnOpacity;
  notifyListeners();
  }

  void opacitys(dynamic opacityvalue){
  _opacity=opacityvalue;
  notifyListeners();
  }

  void ropeOpacitys(dynamic ropeOpacityvalue){
  _ropeOpacity=ropeOpacityvalue;
  notifyListeners();
  }

  

}