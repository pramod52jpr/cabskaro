import 'package:cabskaro/components/bottom_navigator.dart';
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
          LocationPoints(
            onTapStart: () {},
            onTapEnd: () {},
          ),
          CabTypes(
            onTapFourSeater: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CabsAvaibilityScreen(),
                  ));
            },
            onTapFourPlusSeater: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CabsAvaibilityScreen(),
                  ));
            },
            onTapAuto: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CabsAvaibilityScreen(),
                  ));
            },
            onTapBike: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CabsAvaibilityScreen(),
                  ));
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: const Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.oil_barrel),
                      title: Text("Uber Go"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Comfy hatchbacks at pocket-friendly fares."),
                          SizedBox(
                            height: 5,
                          ),
                          Text("4 min Away")
                        ],
                      ),
                      trailing: Text("Rs 155.52/-"),
                    ),
                    ListTile(
                      leading: Icon(Icons.oil_barrel),
                      title: Text("Uber Go"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Comfy hatchbacks at pocket-friendly fares."),
                          SizedBox(
                            height: 5,
                          ),
                          Text("4 min Away")
                        ],
                      ),
                      trailing: Text("Rs 155.52/-"),
                    ),
                    ListTile(
                      leading: Icon(Icons.oil_barrel),
                      title: Text("Uber Go"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Comfy hatchbacks at pocket-friendly fares."),
                          SizedBox(
                            height: 5,
                          ),
                          Text("4 min Away")
                        ],
                      ),
                      trailing: Text("Rs 155.52/-"),
                    ),
                    ListTile(
                      leading: Icon(Icons.oil_barrel),
                      title: Text("Uber Go"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Comfy hatchbacks at pocket-friendly fares."),
                          SizedBox(
                            height: 5,
                          ),
                          Text("4 min Away")
                        ],
                      ),
                      trailing: Text("Rs 155.52/-"),
                    ),
                    ListTile(
                      leading: Icon(Icons.oil_barrel),
                      title: Text("Uber Go"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Comfy hatchbacks at pocket-friendly fares."),
                          SizedBox(
                            height: 5,
                          ),
                          Text("4 min Away")
                        ],
                      ),
                      trailing: Text("Rs 155.52/-"),
                    ),
                    ListTile(
                      leading: Icon(Icons.oil_barrel),
                      title: Text("Uber Go"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Comfy hatchbacks at pocket-friendly fares."),
                          SizedBox(
                            height: 5,
                          ),
                          Text("4 min Away")
                        ],
                      ),
                      trailing: Text("Rs 155.52/-"),
                    ),
                    ListTile(
                      leading: Icon(Icons.oil_barrel),
                      title: Text("Uber Go"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Comfy hatchbacks at pocket-friendly fares."),
                          SizedBox(
                            height: 5,
                          ),
                          Text("4 min Away")
                        ],
                      ),
                      trailing: Text("Rs 155.52/-"),
                    ),
                    ListTile(
                      leading: Icon(Icons.oil_barrel),
                      title: Text("Uber Go"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Comfy hatchbacks at pocket-friendly fares."),
                          SizedBox(
                            height: 5,
                          ),
                          Text("4 min Away")
                        ],
                      ),
                      trailing: Text("Rs 155.52/-"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomNavigator()
        ],
      ),
    );
  }
}
