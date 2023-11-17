import 'dart:async';
import 'package:cabskaro/view/const/sizedbox.dart';
import 'package:cabskaro/view/screens/bottomnav_screens/profile_screens.dart';
import 'package:cabskaro/view/screens/bottomnav_screens/widgets/history_page_widget.dart';
import 'package:cabskaro/view/screens/homepage/components/bottom_navigator.dart';
import 'package:cabskaro/view/screens/homepage/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _completer = Completer();
    double startLatitude = 0.0;
    double startLongitude = 0.0;
    double zoom = 1.0;

    List<Marker> marker = [];

    Map<PolylineId, Polyline> polylines = {};

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GoogleMap(
                    mapType: MapType.terrain,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(startLatitude, startLongitude),
                        zoom: zoom),
                    markers: Set.of(marker),
                    polylines: Set<Polyline>.of(polylines.values),
                    onMapCreated: (controller) {
                      _completer.complete(controller);
                    },
                  ),
                ),
                const SizedBox(
                 // height: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    buildResponsiveRow(
      imageUrl: 'assets/images/icons/earner-illustra.webp',
      title: 'Drive when you\nwant, make what \nyou need',
      description:
          'Make money on your schedule with deliveries or rides—or both. You can use your own car or choose a rental through Uber.',
      buttonUrl:
          'https://bonjour.uber.com/step/7369676e-7570-7369-676e-75707369676e?marketing_vistor_id=beaf200c-ceee-4fca-ace6-1d536bfc69c0&uclick_id=8eaa7613-4f4f-4705-bff6-f5e8aab5fc2d', context: context,
    ),
    kHeight10,
    buildResponsiveRow(
      imageUrl: 'assets/images/icons/u4b-square.webp',
      title: 'The Uber you know, reimagined for business',
      description:
          'Uber for Business is a platform for managing global rides and meals, and local deliveries, for companies of any size.',
      buttonUrl:
          'https://www.uber.com/in/en/business/getting-started/?uclick_id=8eaa7613-4f4f-4705-bff6-f5e8aab5fc2d', context: context,
    ),
    kHeight10,
    buildResponsiveRow(
      imageUrl: 'assets/images/icons/fleet-management.webp',
      title: 'Make money by renting out your\n car',
      description:
          'Connect with thousands of drivers and earn more per week with Uber’s free fleet management tools.',
      buttonUrl:
          'https://www.uber.com/in/en/earn/fleet-management/?uclick_id=8eaa7613-4f4f-4705-bff6-f5e8aab5fc2d', context: context,
    ),
  ],
),

              ),
            ),
          ),
          BottomNavigator(
            onTapDashboard: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(),
                  ),
                  (route) => false);
            },
            onTapRebook: () {},
            onTapAccount: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ));
            },
          ),
        ],
      )),
    );
  }
}
