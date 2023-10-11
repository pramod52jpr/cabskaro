import 'dart:async';

import 'package:cabskaro/components/bottom_navigator.dart';
import 'package:cabskaro/components/cab_companies.dart';
import 'package:cabskaro/services/services.dart';
import 'package:cabskaro/ui/ola_ui/ola_search_end_location.dart';
import 'package:cabskaro/ui/ola_ui/ola_search_start_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UberScreen extends StatefulWidget {
  final String locType;
  final String location;
  const UberScreen({
    super.key,
    this.locType = "start",
    this.location = "current",
  });

  @override
  State<UberScreen> createState() => _UberScreenState();
}

class _UberScreenState extends State<UberScreen> {
  Completer<GoogleMapController> _completer = Completer();
  static const String STARTLOC = "start";
  static const String STARTLAT = "startLat";
  static const String STARTLON = "startLon";
  static const String ENDLOC = "end";
  static const String ENDLAT = "endLat";
  static const String ENDLON = "endLon";
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
        markerId: MarkerId("1"),
        position: LatLng(latitude, longitude),
      ));

      if (endLatitude != 0.0 && endLongitude != 0.0) {
        marker.add(Marker(
          markerId: MarkerId("2"),
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
              markerId: MarkerId("1"),
              position: LatLng(value.latitude, value.longitude),
            ));
            if (endLatitude != 0.0 && endLongitude != 0.0) {
              marker.add(Marker(
                markerId: MarkerId("2"),
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
        markerId: MarkerId("2"),
        position: LatLng(latitude, longitude),
      ));

      if (startLatitude != 0.0 && startLongitude != 0.0) {
        marker.add(Marker(
          markerId: MarkerId("1"),
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
    if (prefs.getString(STARTLOC) != null && prefs.getString(ENDLOC) != null) {
      setState(() {
        startLocationName = prefs.getString(STARTLOC)!;
        startLatitude = prefs.getDouble(STARTLAT)!;
        startLongitude = prefs.getDouble(STARTLON)!;
        endLocationName = prefs.getString(ENDLOC)!;
        endLatitude = prefs.getDouble(ENDLAT)!;
        endLongitude = prefs.getDouble(ENDLON)!;
        zoom = 14.0;
      });
      if (endLatitude != 0.0 &&
          endLongitude != 0.0 &&
          startLatitude != 0.0 &&
          startLongitude != 0.0) {
        getDirections();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    savedLocations();
    if (widget.locType == "start") {
      startLocation();
    } else {
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
      result.points.forEach((PointLatLng pointLatLng) {
        polylineCoordinates
          ..add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
        points.add({'lat': pointLatLng.latitude, 'lng': pointLatLng.longitude});
      });
    }
    addPolyline(polylineCoordinates);
  }

  void addPolyline(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.green,
        points: polylineCoordinates,
        width: 3);
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
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
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 35,
                width: 35,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)]),
                child: Icon(Icons.arrow_back),
              ),
            )
          ])),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 15,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1)),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OlaSearchStartLocation(),
                            ));
                      },
                      child: Hero(
                        tag: "startOla",
                        child: Material(
                          child: Container(
                            width: 200,
                            height: 30,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 5),
                            child: Text(
                              startLocationName,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 320,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.5)),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OlaSearchEndLocation(),
                            ));
                      },
                      child: Hero(
                        tag: "endOla",
                        child: Material(
                          child: Container(
                            width: 200,
                            height: 30,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 5),
                            child: Text(
                              endLocationName,
                              style: TextStyle(overflow: TextOverflow.ellipsis),
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
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5)),
          ),
          Container(
            height: 300,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: Text("Mini"),
                    leading: CircleAvatar(
                      radius: 20,
                      child: Image.asset(
                        "assets/images/cabsicon/mini.png",
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    trailing: Text("Rs. 185.52/-"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Comfy hatchbacks at pocket-friendly fares."),
                        SizedBox(
                          height: 5,
                        ),
                        Text("4 min away")
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text("Prime SUV"),
                    leading: CircleAvatar(
                      radius: 20,
                      child: Image.asset(
                        "assets/images/cabsicon/suv.png",
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    trailing: Text("Rs. 185.52/-"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Comfy hatchbacks at pocket-friendly fares."),
                        SizedBox(
                          height: 5,
                        ),
                        Text("4 min away")
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text("Bike"),
                    leading: CircleAvatar(
                      radius: 20,
                      child: Image.asset(
                        "assets/images/cabsicon/bike.png",
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    trailing: Text("Rs. 185.52/-"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Comfy hatchbacks at pocket-friendly fares."),
                        SizedBox(
                          height: 5,
                        ),
                        Text("4 min away")
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text("Prime Sedan"),
                    leading: CircleAvatar(
                      radius: 20,
                      child: Image.asset(
                        "assets/images/cabsicon/sedan.png",
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    trailing: Text("Rs. 185.52/-"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Comfy hatchbacks at pocket-friendly fares."),
                        SizedBox(
                          height: 5,
                        ),
                        Text("4 min away")
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text("Prime Sedan"),
                    leading: CircleAvatar(
                      radius: 20,
                      child: Image.asset(
                        "assets/images/cabsicon/sedan.png",
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    trailing: Text("Rs. 185.52/-"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Comfy hatchbacks at pocket-friendly fares."),
                        SizedBox(
                          height: 5,
                        ),
                        Text("4 min away")
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text("Prime Sedan"),
                    leading: CircleAvatar(
                      radius: 20,
                      child: Image.asset(
                        "assets/images/cabsicon/sedan.png",
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    trailing: Text("Rs. 185.52/-"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Comfy hatchbacks at pocket-friendly fares."),
                        SizedBox(
                          height: 5,
                        ),
                        Text("4 min away")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                showDragHandle: true,
                context: context, builder: (context) {
                return Scaffold(body: Text("data"));
              },);
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 25),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Book OLA",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),
          CabCompanies(
            onTapUber: () {},
            onTapOla: () {},
            onTapRapido: () {},
            onTapMeru: () {},
            onTapBlueSmart: () {},
            onTapIndrive: () {},
            onTapBlaBla: () {},
          ),
          BottomNavigator()
        ],
      ),
    );
  }
}
