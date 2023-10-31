// import 'package:cabskaro/view/screens/bottomnav_screens/history_screens.dart';
// import 'package:cabskaro/view/screens/bottomnav_screens/profile_screens.dart';
// import 'package:cabskaro/view/screens/homepage/dashboard_screen.dart';
// import 'package:flutter/material.dart';

// class BottomNav extends StatefulWidget {
//   const BottomNav({super.key});

//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   int pageindex=0;
//   final List<Widget> tablist=[
//     DashboardScreen(),
//     HistoryScreen(),
//     ProfileScreen(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return  Scaffold(
//       body: Stack(
//         children: [
//           tablist.elementAt(pageindex),
//           Container(
//             margin: EdgeInsets.only(bottom: 10,left: 30,right: 30,top: 10),
//             child: Align(
//               alignment: Alignment(0.0, 1.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(30)),
//                 child: Container(
//                   height: 40,
//                   child: BottomNavigationBar(selectedItemColor: Colors.amber, items: [
//                     BottomNavigationBarItem(icon: Image.asset('assets/images/icons/bottom-btn-first.png', height: screenHeight * 0.045),label: 'Home'),
//                     BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'History'),
//                     BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Profile'),
//                   ],
//                   unselectedItemColor: Colors.grey,
//                   showSelectedLabels: true,
//                   showUnselectedLabels: false,
//                   backgroundColor: Colors.black,
//                   currentIndex: pageindex,
//                   onTap: (int index) {
//                     setState(() {
//                       pageindex=index;
//                     });
//                   },
//                   ),
//                 ),
//               ), 
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }