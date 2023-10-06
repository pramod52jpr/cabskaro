import 'package:cabskaro/components/cab_types.dart';
import 'package:cabskaro/components/location_points.dart';
import 'package:flutter/material.dart';

class CabsAvaibilityScreen extends StatefulWidget {
  const CabsAvaibilityScreen({super.key});

  @override
  State<CabsAvaibilityScreen> createState() => _CabsAvaibilityScreenState();
}

class _CabsAvaibilityScreenState extends State<CabsAvaibilityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: const Text("Cabs Karo")),
      body: Column(
        children: [
          const LocationPoints(),
          CabTypes(
            onTapFourSeater: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CabsAvaibilityScreen(),
                  ));
            },
            onTapFourPlusSeater: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CabsAvaibilityScreen(),
                  ));
            },
            onTapAuto: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CabsAvaibilityScreen(),
                  ));
            },
            onTapBike: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CabsAvaibilityScreen(),
                  ));
            },
          ),
          const SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.oil_barrel),
                  title: Text("Uber Go"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Comfy hatchbacks at pocket-friendly fares."),
                      SizedBox(height: 5,),
                      Text("4 min Away")
                    ],
                  ),
                  trailing: Text("Rs 155.52/-"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
