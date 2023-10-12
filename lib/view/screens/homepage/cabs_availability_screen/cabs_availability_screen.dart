
import 'package:cabskaro/view/screens/homepage/components/bottom_navigator.dart';
import 'package:cabskaro/view/screens/homepage/components/cab_types.dart';
import 'package:cabskaro/view/screens/homepage/components/location_points.dart';
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CabsAvaibilityScreen(),
                ),
              );
            },
            onTapFourPlusSeater: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CabsAvaibilityScreen(),
                ),
              );
            },
            onTapAuto: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CabsAvaibilityScreen(),
                ),
              );
            },
            onTapBike: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CabsAvaibilityScreen(),
                ),
              );
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
          const BottomNavigator(),
        ],
      ),
    );
  }
}
