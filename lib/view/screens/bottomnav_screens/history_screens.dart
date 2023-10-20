// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:cabskaro/view/const/sizedbox.dart';
import 'package:cabskaro/view/screens/bottomnav_screens/profile_screens.dart';
import 'package:cabskaro/view/screens/homepage/dashboard_screen.dart';
import 'package:cabskaro/view/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HistoryScreen extends StatelessWidget {
   HistoryScreen({super.key});

  final Completer<GoogleMapController> _completer = Completer();

  String startLocationName = "Current Location";

  double startLatitude = 0.0;

  double startLongitude = 0.0;

  String endLocationName = "Select Destination";

  double endLatitude = 0.0;

  double endLongitude = 0.0;

  double zoom = 1.0;

  List<Marker> marker = [];

  PolylinePoints polylinePoints = PolylinePoints();

  Map<PolylineId, Polyline> polylines = {};

  @override
  Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          BackButtonWidget(
            text: '',
          ),
          kHeight20,
          Container(
            height: screenHeight/3.6,
            width: 370,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 1.0), // Gray border
            ),
            child: Column(
              children: [
                kHeight10,
                Container(
                  height: screenHeight/8.2,
                  width: screenWidth*0.850,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 24, 24, 20),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GoogleMap(
                    mapType: MapType.terrain,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(startLatitude, startLongitude),
                        zoom: zoom),
                    markers: Set.of(marker),
                    polylines: Set<Polyline>.of(polylines.values),
                    myLocationEnabled: true,
                    onMapCreated: (controller) {
                      _completer.complete(controller);
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    margin: const EdgeInsets.only(right: 70),
                    child: const Text(
                      'Connaught Place,New Delhi,Delhi',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )),
                kHeight5,
                Container(
                    margin: const EdgeInsets.only(right: 210),
                    child: const Text(
                      '30 Sep, 12.16 pm',
                      style: TextStyle(),
                    )),
                kHeight5,
                Container(
                    margin: const EdgeInsets.only(right: 270),
                    child: const Text(
                      '₹ 47.00',
                      style: TextStyle(),
                    )),
                kHeight10,
                Row(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          kWidth10,
                           Icon(Icons.star_border),
                           SizedBox(
                            width: 3,
                          ),
                          Text('Rate')
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange),
                      margin: const EdgeInsets.only(left: 20),
                      height: screenHeight*0.040,
                      width: screenWidth*0.20,
                    ),
                    Container(
                      child: Row(
                        children: [
                          kWidth10,
                          const Icon(Icons.rotate_right),
                          SizedBox(
                            width: 3,
                          ),
                          const Text('Rebook')
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange),
                      margin: const EdgeInsets.only(left: 20),
                      height: screenHeight*0.040,
                      width: screenWidth*0.25,
                    ),
                  ],
                ),
              ],
            ),
          ),
          kHeight10,
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => kHeight10,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    'Connaught Place, New Delhi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  leading: CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.transparent,
                    child: Image.asset('assets/images/cabsicon/motobike.png'),
                  ),
                  trailing: Container(
                    child: const Row(
                      children: [
                        kWidth10,
                        Icon(Icons.rotate_right),
                        SizedBox(
                          width: 3,
                        ),
                        Text('Rebook')
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange),
                    margin: const EdgeInsets.only(left: 20),
                    height: screenHeight*0.040,
                      width: screenWidth*0.24,
                  ),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("30 Sep . 12:16 pm"),
                      SizedBox(height: 5),
                      Text("₹47.00"),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin:  EdgeInsets.only(left: screenWidth*0.074, right: screenWidth*0.074, bottom: screenHeight*0.010),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenHeight*0.050),
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
                      height: screenHeight*0.044, 
                    )),
                InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/icons/bottom-btn-car.png",
                     height: screenHeight*0.044, 
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
                    height: screenHeight*0.044, 
                    ))
              ],
            ),
          )
        ],
      )),
    );
  }
}
