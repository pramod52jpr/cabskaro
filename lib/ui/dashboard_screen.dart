import 'dart:async';

import 'package:cabskaro/components/bottom_navigator.dart';
import 'package:cabskaro/components/cab_types.dart';
import 'package:cabskaro/components/location_points.dart';
import 'package:cabskaro/services/services.dart';
import 'package:cabskaro/ui/cabs_availability_screen.dart';
import 'package:cabskaro/ui/search_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Completer<GoogleMapController> _completer = Completer();
  double latitude = 12.876;
  double longitude = 12.087;
  double zoom = 1.0;
  List<Marker> marker = [];

  void animateLocation() async {
    CameraPosition newCameraPosition =
        CameraPosition(target: LatLng(latitude, longitude), zoom: zoom);
    GoogleMapController controller = await _completer.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }

  void currentLocation() {
    Services().getUserLocation().then((value) {
      if (value != null) {
        setState(() {
          latitude = value.latitude;
          longitude = value.longitude;
          zoom = 14.0;
          marker.add(Marker(
              markerId: MarkerId("1"),
              position: LatLng(latitude, longitude),
              infoWindow: InfoWindow(title: "Current Location")));
          animateLocation();
        });
      }
    }).onError((error, stackTrace) {
      Services().toastmsg("There is some error", false);
    });
  }

  @override
  void initState() {
    super.initState();
    currentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 10,
                    width: 30,
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2))
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 10,
                    width: 30,
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2))
                    ]),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey, blurRadius: 5, spreadRadius: 1)
                      ],
                      border: Border.all(
                          color: const Color.fromRGBO(227, 132, 42, 0.8)),
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image:
                              AssetImage("assets/images/icons/backscreen.jpg"),
                          fit: BoxFit.cover)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Cabs karo",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/images/icons/notification.png",
                        height: 25,
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 10,
                    width: 30,
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2))
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 10,
                    width: 30,
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2))
                    ]),
                  ),
                ],
              ),
            ],
          ),
          LocationPoints(
            onTapStart: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchLocation(),
                  ));
            },
            onTapEnd: () {},
          ),
          Expanded(
            child: Column(
              children: [
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
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: GoogleMap(
                      mapType: MapType.terrain,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(latitude, longitude), zoom: zoom),
                      markers: Set.of(marker),
                      onMapCreated: (controller) {
                        _completer.complete(controller);
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            currentLocation();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: Image.asset(
                              "assets/images/icons/uber-logo.png",
                              height: 40,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DashboardScreen(),
                                ));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: Image.asset(
                              "assets/images/icons/ola-logo.png",
                              height: 50,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: Image.asset(
                              "assets/images/icons/rapido-logo.png",
                              height: 40,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: Image.asset(
                              "assets/images/icons/meru-logo.png",
                              height: 40,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: Image.asset(
                              "assets/images/icons/blu-smart-logo.png",
                              height: 40,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: Image.asset(
                              "assets/images/icons/indrive-logo.png",
                              height: 40,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: Image.asset(
                              "assets/images/icons/bla-bla-logo.png",
                              height: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const BottomNavigator(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
