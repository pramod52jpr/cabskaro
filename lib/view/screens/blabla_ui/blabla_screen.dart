import 'dart:async';

import 'package:cabskaro/controller/services/services.dart';
import 'package:cabskaro/view/screens/blabla_ui/blabla_search_end_location.dart';
import 'package:cabskaro/view/screens/blabla_ui/blabla_search_start_location.dart';
import 'package:cabskaro/view/screens/blusmart_ui/blusmart_screen.dart';
import 'package:cabskaro/view/screens/bottomnav_screens/history_screens.dart';
import 'package:cabskaro/view/screens/bottomnav_screens/profile_screens.dart';
import 'package:cabskaro/view/screens/homepage/components/bottom_navigator.dart';
import 'package:cabskaro/view/screens/homepage/dashboard_screen.dart';
import 'package:cabskaro/view/screens/indrive_ui/indrive_screen.dart';
import 'package:cabskaro/view/screens/meru_ui/meru_screen.dart';
import 'package:cabskaro/view/screens/ola_ui/ola_screen.dart';
import 'package:cabskaro/view/screens/rapido_ui/rapido_screen.dart';
import 'package:cabskaro/view/screens/uber_ui/uber_screen.dart';
import 'package:cabskaro/view/widgets/cab_companies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlaBlaScreen extends StatefulWidget {
  final String locType;
  final String location;
  const BlaBlaScreen({
    super.key,
    this.locType = "",
    this.location = "current",
  });

  @override
  State<BlaBlaScreen> createState() => _BlaBlaScreenState();
}

class _BlaBlaScreenState extends State<BlaBlaScreen> {
  final Completer<GoogleMapController> _completer = Completer();
  static const String STARTLOC = "start";
  static const String STARTLAT = "startLat";
  static const String STARTLON = "startLon";
  static const String ENDLOC = "end";
  static const String ENDLAT = "endLat";
  static const String ENDLON = "endLon";
  String startLocationName = "Pickup Location";
  double startLatitude = 0.0;
  double startLongitude = 0.0;
  String endLocationName = "Destination Location";
  double endLatitude = 0.0;
  double endLongitude = 0.0;
  double zoom = 1.0;
  List<Marker> marker = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};

// start location

  void animateStartLocation(double latitude, double longitude) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(STARTLOC, "Current Location");
    prefs.setDouble(STARTLAT, latitude);
    prefs.setDouble(STARTLON, longitude);
    setState(() {
      startLatitude = latitude;
      startLongitude = longitude;
    });
    setState(() {
      startLocationName = prefs.getString(STARTLOC)!;
      startLatitude = prefs.getDouble(STARTLAT)!;
      startLongitude = prefs.getDouble(STARTLON)!;
    });
    CameraPosition newCameraPosition =
        CameraPosition(target: LatLng(latitude, longitude), zoom: zoom);
    GoogleMapController controller = await _completer.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition))
        .then((value) {
      if (endLatitude != 0.0 &&
          endLongitude != 0.0 &&
          startLatitude != 0.0 &&
          startLongitude != 0.0) {
        getDirections();
      }
    });
  }

  void animateStart(double latitude, double longitude) async {
    CameraPosition newCameraPosition =
        CameraPosition(target: LatLng(latitude, longitude), zoom: zoom);
    GoogleMapController controller = await _completer.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition))
        .then((value) {
      if (endLatitude != 0.0 &&
          endLongitude != 0.0 &&
          startLatitude != 0.0 &&
          startLongitude != 0.0) {
        getDirections();
      }
    });
  }

  void setStartValue(double latitude, double longitude) {
    setState(() {
      zoom = 14.0;
      marker.add(Marker(
        markerId: const MarkerId("1"),
        position: LatLng(latitude, longitude),
      ));

      if (endLatitude != 0.0 && endLongitude != 0.0) {
        zoom = 11.0;
        marker.add(Marker(
          markerId: const MarkerId("2"),
          position: LatLng(endLatitude, endLongitude),
        ));
      }
    });
    setState(() {
      startLatitude = latitude;
      startLongitude = longitude;
      zoom = 14.0;
    });
  }

  void getStartLocation() async {
    List<Location> location = await locationFromAddress(widget.location);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(STARTLOC, widget.location);
    prefs.setDouble(STARTLAT, location[0].latitude);
    prefs.setDouble(STARTLON, location[0].longitude);

    setStartValue(location[0].latitude, location[0].longitude);
    setState(() {
      startLocationName = prefs.getString(STARTLOC)!;
      startLatitude = prefs.getDouble(STARTLAT)!;
      startLongitude = prefs.getDouble(STARTLON)!;
    });
    animateStart(location[0].latitude, location[0].longitude);
  }

  void startLocation() async {
    if (widget.location == "current") {
      Services().getUserLocation().then((value) {
        if (value != null) {
          setState(() {
            zoom = 14.0;
            marker.add(Marker(
              markerId: const MarkerId("1"),
              position: LatLng(value.latitude, value.longitude),
            ));
            if (endLatitude != 0.0 && endLongitude != 0.0) {
              zoom = 11.0;
              marker.add(Marker(
                markerId: const MarkerId("2"),
                position: LatLng(endLatitude, endLongitude),
              ));
            }
            animateStartLocation(value.latitude, value.longitude);
          });
        }
      }).onError((error, stackTrace) {
        Services().toastmsg("There is some error", false);
      });
    } else {
      getStartLocation();
    }
  }

// start location end
// end location start

  void setEndValue(double latitude, double longitude) {
    setState(() {
      zoom = 14.0;
      marker.add(Marker(
        markerId: const MarkerId("2"),
        position: LatLng(latitude, longitude),
      ));

      if (startLatitude != 0.0 && startLongitude != 0.0) {
        zoom = 11.0;
        marker.add(Marker(
          markerId: const MarkerId("1"),
          position: LatLng(startLatitude, startLongitude),
        ));
      }
    });
    setState(() {
      endLatitude = latitude;
      endLongitude = longitude;
      zoom = 14.0;
    });
  }

  void animateEnd(double latitude, double longitude) async {
    CameraPosition newCameraPosition =
        CameraPosition(target: LatLng(latitude, longitude), zoom: zoom);
    GoogleMapController controller = await _completer.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition))
        .then((value) {
      if (endLatitude != 0.0 &&
          endLongitude != 0.0 &&
          startLatitude != 0.0 &&
          startLongitude != 0.0) {
        getDirections();
      }
    });
  }

  void endLocation() async {
    List<Location> location = await locationFromAddress(widget.location);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(ENDLOC, widget.location);
    prefs.setDouble(ENDLAT, location[0].latitude);
    prefs.setDouble(ENDLON, location[0].longitude);

    setEndValue(location[0].latitude, location[0].longitude);
    setState(() {
      endLocationName = prefs.getString(ENDLOC)!;
      endLatitude = prefs.getDouble(ENDLAT)!;
      endLongitude = prefs.getDouble(ENDLON)!;
    });
    animateEnd(location[0].latitude, location[0].longitude);
  }

// end location end

  void savedLocations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(STARTLOC) != null) {
      setState(() {
        startLocationName = prefs.getString(STARTLOC)!;
        startLatitude = prefs.getDouble(STARTLAT)!;
        startLongitude = prefs.getDouble(STARTLON)!;
        zoom = 14.0;
      });
    }
    if (prefs.getString(ENDLOC) != null) {
      setState(() {
        endLocationName = prefs.getString(ENDLOC)!;
        endLatitude = prefs.getDouble(ENDLAT)!;
        endLongitude = prefs.getDouble(ENDLON)!;
        zoom = 14.0;
      });
    }
    if (endLatitude != 0.0 &&
        endLongitude != 0.0 &&
        startLatitude != 0.0 &&
        startLongitude != 0.0) {
      setState(() {
        zoom = 11.0;
        marker.add(Marker(
          markerId: const MarkerId("2"),
          position: LatLng(endLatitude, endLongitude),
        ));
        marker.add(Marker(
          markerId: const MarkerId("1"),
          position: LatLng(startLatitude, startLongitude),
        ));
      });
      CameraPosition newCameraPosition =
          CameraPosition(target: LatLng(endLatitude, endLongitude), zoom: zoom);
      GoogleMapController controller = await _completer.future;
      controller
          .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
      getDirections();
    }
  }

  @override
  void initState() {
    super.initState();
    savedLocations();
    if (widget.locType == "start") {
      startLocation();
    } else if (widget.locType == "end") {
      endLocation();
    }
  }

  void getDirections() async {
    List<LatLng> polylineCoordinates = [];
    List<dynamic> points = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyA0r0oRC03tITR0FNYVfKT-SlXEvf_FDp0",
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(endLatitude, endLongitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      for (var pointLatLng in result.points) {
        polylineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
        points.add({'lat': pointLatLng.latitude, 'lng': pointLatLng.longitude});
      }
    }
    addPolyline(polylineCoordinates);
  }

  void addPolyline(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId('poly');
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.blue,
        points: polylineCoordinates,
        width: 3);
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Stack(children: [
              GoogleMap(
                mapType: MapType.terrain,
                initialCameraPosition: CameraPosition(
                    target: LatLng(startLatitude, startLongitude), zoom: zoom),
                markers: Set.of(marker),
                polylines: Set<Polyline>.of(polylines.values),
                myLocationEnabled: true,
                onMapCreated: (controller) {
                  _completer.complete(controller);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 5,
                            color: Colors.grey,
                            spreadRadius: 2,
                            offset: Offset(2, 2))
                      ]),
                  height: 80,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.locationCrosshairs,
                            size: 20,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FaIcon(
                            FontAwesomeIcons.locationDot,
                            size: 20,
                            color: Colors.red,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BlaBlaSearchStartLocation(),
                                  ));
                            },
                            child: Hero(
                              tag: "startBlaBla",
                              child: Material(
                                child: Container(
                                  width: mediaQuery.size.width * 0.7,
                                  height: 30,
                                  color: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 5),
                                  child: Text(
                                    startLocationName,
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: mediaQuery.size.width * 0.7,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 0.5)),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BlaBlaSearchEndLocation(),
                                  ));
                            },
                            child: Hero(
                              tag: "endBlaBla",
                              child: Material(
                                child: Container(
                                  width: mediaQuery.size.width * 0.7,
                                  height: 30,
                                  color: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 5),
                                  child: Text(
                                    endLocationName,
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ])),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 230),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.grey,
                        spreadRadius: 0,
                        offset: Offset(0, -5),
                      )
                    ]),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/cabsicon/motobike.png",
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Bike"),
                                  ],
                                ),
                                const Text("4 min away"),
                                const Text("Rs. 185.52/-"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/cabsicon/auto.png",
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Auto"),
                                  ],
                                ),
                                const Text("4 min away"),
                                const Text("Rs. 185.52/-"),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  showDragHandle: true,
                  context: context,
                  isDismissible: false,
                  enableDrag: false,
                  isScrollControlled: false,
                  useRootNavigator: false,
                  constraints: const BoxConstraints(
                      maxHeight: 3000,
                      minHeight: 200,
                      minWidth: double.infinity),
                  builder: (context) {
                    return const Text("data");
                  },
                );
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 191, 255),
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Book Bla Bla",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            CabCompanies(
              onTapUber: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UberScreen(),
                    ));
              },
              onTapOla: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OlaScreen(),
                    ));
              },
              onTapRapido: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RapidoScreen(),
                    ));
              },
              onTapMeru: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MeruScreen(),
                    ));
              },
              onTapBlueSmart: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BlusmartScreen(),
                    ));
              },
              onTapIndrive: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IndriveScreen(),
                    ));
              },
              onTapBlaBla: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BlaBlaScreen(),
                    ));
              },
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
      ),
    );
  }
}
