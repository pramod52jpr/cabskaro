import 'package:cabskaro/view/screens/bottomnav_screens/history_screens.dart';
import 'package:cabskaro/view/screens/bottomnav_screens/profile_screens.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/images/icons/bottom-btn-first.png",
                height: 40,
              )),
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HistoryScreen();
                }));
              },
              child: Image.asset(
                "assets/images/icons/bottom-btn-car.png",
                height: 40,
              )),
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProfileScreen();
                }));
              },
              child: Image.asset(
                "assets/images/icons/bottom-btn-user.png",
                height: 40,
              ))
        ],
      ),
    );
  }
}
