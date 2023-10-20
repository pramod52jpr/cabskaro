import 'package:cabskaro/view/screens/bottomnav_screens/history_screens.dart';
import 'package:cabskaro/view/screens/bottomnav_screens/profile_screens.dart';
import 'package:cabskaro/view/screens/homepage/dashboard_screen.dart';
import 'package:flutter/material.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth*0.050),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const DashboardScreen();
                }));
              },
              child: Image.asset(
                "assets/images/icons/bottom-btn-first.png",
height: screenHeight*0.045,
                //height: 40,
              )),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return  HistoryScreen();
                }));
              },
              child: Image.asset(
                "assets/images/icons/bottom-btn-car.png",
height: screenHeight*0.045,
              )),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return ProfileScreen();
                }));
              },
              child: Image.asset(
                "assets/images/icons/bottom-btn-user.png",
height: screenHeight*0.045,
              ))
        ],
      ),
    );
  }
}