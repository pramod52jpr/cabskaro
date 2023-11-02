import 'package:cabskaro/view/screens/bottomnav_screens/history_screens.dart';
import 'package:cabskaro/view/screens/bottomnav_screens/profile_screens.dart';
import 'package:cabskaro/view/screens/homepage/components/bottom_navigator.dart';
import 'package:cabskaro/view/screens/homepage/components/cab_types.dart';
import 'package:cabskaro/view/screens/homepage/components/location_points.dart';
import 'package:cabskaro/view/screens/homepage/dashboard_screen.dart';
import 'package:flutter/material.dart';

class CabsAvaibilityScreen extends StatelessWidget {
  const CabsAvaibilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text("Cabs Karo"),
      ),
      body: Column(
        children: [
          LocationPoints(
            onTapStart: () {},
            onTapEnd: () {},
            onTapInterchange: () {},
            startLocation: "my location",
            endLocation: "last location",
          ),
          CabTypes(
            onTapFourSeater: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CabsAvaibilityScreen();
                    }));
            },
            onTapFourPlusSeater: () {
             Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CabsAvaibilityScreen();
                    }));
            },
            onTapAuto: () {
               Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CabsAvaibilityScreen();
                    }));
            },
            onTapBike: () {
             Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CabsAvaibilityScreen();
                    }));
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return const ListTile(
                  leading: Icon(Icons.oil_barrel),
                  title: Text("Uber Go"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Comfy hatchbacks at pocket-friendly fares."),
                      SizedBox(height: 5),
                      Text("4 min Away"),
                    ],
                  ),
                  trailing: Text("Rs 155.52/-"),
                );
              },
            ),
          ),
          BottomNavigator(
                      onTapDashboard: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashboardScreen(),
                            ));
                      },
                      onTapRebook: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HistoryScreen(),
                            ));
                      },
                      onTapAccount: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ));
                      },
                    ),
        ],
      ),
    );
  }
}
