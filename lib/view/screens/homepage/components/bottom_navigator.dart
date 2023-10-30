import 'package:cabskaro/view/screens/bottomnav_screens/history_screens.dart';
import 'package:cabskaro/view/screens/bottomnav_screens/profile_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
     final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin:  EdgeInsets.only(left: screenWidth*0.074, right: screenWidth*0.074, bottom: screenHeight*0.010,),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth*0.050),
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/images/icons/bottom-btn-first.png",
                height: screenHeight*0.044,
              )),
          InkWell(
              onTap: () {
                Get.to(HistoryScreen());
              },
              child: Image.asset(
                "assets/images/icons/bottom-btn-car.png",
height: screenHeight*0.044,              )),
          InkWell(
              onTap: () {
                 Get.to(ProfileScreen());
              },
              child: Image.asset(
                "assets/images/icons/bottom-btn-user.png",
height: screenHeight*0.044,              ))
        ],
      ),
    );
  }
}
