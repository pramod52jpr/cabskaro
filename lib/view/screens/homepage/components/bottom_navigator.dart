import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  final VoidCallback onTapDashboard;
  final VoidCallback onTapRebook;
  final VoidCallback onTapAccount;
  const BottomNavigator({super.key,
  required this.onTapDashboard,
  required this.onTapRebook,
  required this.onTapAccount,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(
        left: screenWidth * 0.074,
        right: screenWidth * 0.074,
        bottom: screenHeight * 0.010,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.050),
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: onTapDashboard,
              child: Image.asset(
                "assets/images/icons/bottom-btn-first.png",
                height: screenHeight * 0.044,
              )),
          InkWell(
              onTap: onTapRebook,
              child: Image.asset(
                "assets/images/icons/bottom-btn-car.png",
                height: screenHeight * 0.044,
              )),
          InkWell(
              onTap: onTapAccount,
              child: Image.asset(
                "assets/images/icons/bottom-btn-user.png",
                height: screenHeight * 0.044,
              ))
        ],
      ),
    );
  }
}
