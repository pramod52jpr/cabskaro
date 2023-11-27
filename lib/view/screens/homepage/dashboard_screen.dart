import 'dart:async';
import 'package:cabskaro/view/screens/bottomnav_screens/history_screens.dart';
import 'package:cabskaro/view/screens/bottomnav_screens/profile_screens.dart';
import 'package:cabskaro/view/screens/homepage/components/bottom_navigator.dart';
import 'package:cabskaro/view/widgets/cab_companies.dart';
import 'package:cabskaro/view/screens/homepage/components/location_points.dart';
import 'package:cabskaro/controller/services/services.dart';
import 'package:cabskaro/view/screens/homepage/searching_locations/search_end_location.dart';
import 'package:cabskaro/view/screens/homepage/searching_locations/search_start_location.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends StatefulWidget {
  final String locType;
  final String location;
  const DashboardScreen({
    super.key,
    this.locType = "",
    this.location = "current",
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Marker> marker = [];

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

  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};

  BitmapDescriptor icon = BitmapDescriptor.defaultMarker;
  Future customIcon() async {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(), "assets/images/icons/markerman.png")
        .then((value) {
      setState(() {
        icon = value;
      });
    });
  }
  
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

  Future setStartValue(double latitude, double longitude) async {
    await customIcon();
    setState(() {
      zoom = 14.0;
      marker.add(Marker(
        markerId: const MarkerId("1"),
        position: LatLng(latitude, longitude),
        icon: icon,
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

    await setStartValue(location[0].latitude, location[0].longitude);
    setState(() {
      startLocationName = prefs.getString(STARTLOC)!;
      startLatitude = prefs.getDouble(STARTLAT)!;
      startLongitude = prefs.getDouble(STARTLON)!;
    });
    animateStart(location[0].latitude, location[0].longitude);
  }

  void startLocation() async {
    await customIcon();
    if (widget.location == "current") {
      Services().getUserLocation().then((value) {
        if (value != null) {
          setState(() {
            zoom = 14.0;
            marker.add(Marker(
              markerId: const MarkerId("1"),
              position: LatLng(value.latitude, value.longitude),
              icon: icon,
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

  Future setEndValue(double latitude, double longitude) async {
    await customIcon();
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
          icon: icon,
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

    await setEndValue(location[0].latitude, location[0].longitude);
    setState(() {
      endLocationName = prefs.getString(ENDLOC)!;
      endLatitude = prefs.getDouble(ENDLAT)!;
      endLongitude = prefs.getDouble(ENDLON)!;
    });
    animateEnd(location[0].latitude, location[0].longitude);
  }

// end location end

  void savedLocations() async {
    await customIcon();
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
      zoom = 11.0;
      marker.clear();
      marker.add(Marker(
        markerId: const MarkerId("1"),
        position: LatLng(startLatitude, startLongitude),
        icon: icon,
      ));
      marker.add(Marker(
        markerId: const MarkerId("2"),
        position: LatLng(endLatitude, endLongitude),
      ));
      setState(() {});
      CameraPosition newCameraPosition =
          CameraPosition(target: LatLng(endLatitude, endLongitude), zoom: zoom);
      GoogleMapController controller = await _completer.future;
      await getDirections().then((value) {
        controller
            .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
      });
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

  Future getDirections() async {
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

  Future interchangeLocations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(STARTLOC) != null && prefs.getString(ENDLOC) != null) {
      setState(() {
        prefs.setString(STARTLOC, endLocationName);
        prefs.setDouble(STARTLAT, endLatitude);
        prefs.setDouble(STARTLON, endLongitude);

        prefs.setString(ENDLOC, startLocationName);
        prefs.setDouble(ENDLAT, startLatitude);
        prefs.setDouble(ENDLON, startLongitude);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    Connectivity connectivity = Connectivity();

    return Scaffold(
      backgroundColor: Colors.white,
        body: StreamBuilder<ConnectivityResult>(
      stream: connectivity.onConnectivityChanged,
      builder: (context, snapshot) {
        if (snapshot.data == ConnectivityResult.none) {
          return Center(
              child: lottie.Lottie.asset("animations/no_internet.json",
                  width: double.infinity, fit: BoxFit.contain));
        }
        return SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 5),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: screenHeight * 0.010,
                        width: screenWidth * 0.074,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
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
                        height: screenHeight * 0.010,
                        width: screenWidth * 0.074,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
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
                      padding: EdgeInsets.all(screenWidth * 0.050),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                spreadRadius: 1)
                          ],
                          border: Border.all(
                              color: const Color.fromRGBO(227, 132, 42, 0.8)),
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage(
                                  "assets/images/icons/backscreen.jpg"),
                              fit: BoxFit.cover)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello",
                                style:
                                    TextStyle(fontSize: screenHeight * 0.018),
                              ),
                              Text(
                                greeting(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: screenHeight * 0.010,
                        width: screenWidth * 0.074,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
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
                        height: screenHeight * 0.010,
                        width: screenWidth * 0.074,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
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
                startLocation: startLocationName,
                endLocation: endLocationName,
                onTapStart: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchStartLocation(),
                      ));
                },
                onTapEnd: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchEndLocation(),
                      ));
                },
                onTapInterchange: () {
                  interchangeLocations().then((value) {
                    savedLocations();
                  });
                },
              ),
              Expanded(
                child: Column(
                  children: [
                    // CabTypes(
                    //   onTapFourSeater: () {
                    //   Get.to(CabsAvaibilityScreen(),);
                    //   },
                    //   onTapFourPlusSeater: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) =>
                    //               const CabsAvaibilityScreen(),
                    //         ));
                    //   },
                    //   onTapAuto: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) =>
                    //               const CabsAvaibilityScreen(),
                    //         ));
                    //   },
                    //   onTapBike: () {
                    //     UberServices().generateAndStoreAccessToken();
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) =>
                    //               const CabsAvaibilityScreen(),
                    //         ));
                    //   },
                    // ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.074, vertical: 5),
                        child: GoogleMap(

                          myLocationButtonEnabled: true,
 cameraTargetBounds: CameraTargetBounds(
    LatLngBounds(
      southwest: LatLng(27.0, 76.0), 
      northeast: LatLng(29.0, 78.0),
    ),
  ),                        
                          buildingsEnabled: true,
                          mapType: MapType.terrain,
                          initialCameraPosition: CameraPosition(
                              target: LatLng(28.1992, 77.4512), zoom: zoom),
                          markers: Set.of(marker),
                          polylines: Set<Polyline>.of(polylines.values),
                          myLocationEnabled: true,
                          onMapCreated: (controller) {
                            _completer.complete(controller);
                          },
                        ),
                      ),
                    ),
                    CabCompanies(
                      onTapUber: () {
                        launchUrl(Uri.parse("https://m.uber.com/go/pickup"));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const UberScreen(),
                        //     ));
                      },
                      onTapOla: () {
                        launchUrl(Uri.parse("https://www.olacabs.com/"));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const OlaScreen(),
                        //     ));
                      },
                      onTapRapido: () {
                        launchUrl(Uri.parse("https://www.rapido.bike/"));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const RapidoScreen(),
                        //     ));
                      },
                      onTapMeru: () {
                        launchUrl(Uri.parse("https://www.meru.in/"));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const MeruScreen(),
                        //     ));
                      },
                      onTapBlueSmart: () {
                        launchUrl(Uri.parse("https://blu-smart.com/"));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const BlusmartScreen(),
                        //     ));
                      },
                      onTapIndrive: () {
                        launchUrl(Uri.parse(
                            "https://intercity.indrive.com/en?utm_source=google&utm_medium=cpc&utm_campaign=ic_client_ua_ga_search_launch_india_ppc_191222_main&adposition=&utm_term=indriver%20intercity&gclid=CjwKCAjwp8OpBhAFEiwAG7NaEudwDo_g8ntI0CjtCAhpATMY3szvMj5--Khn_-CVkUvsntJDSzoeqRoCLX8QAvD_BwE"));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const IndriveScreen(),
                        //     ));
                      },
                      onTapBlaBla: () {
                        launchUrl(Uri.parse("https://www.blablacar.in/search-car-sharing"));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const BlaBlaScreen(),
                        //     ));
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BottomNavigator(
                      onTapDashboard: () {},
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
              )
            ],
          ),
        );
      },
    ));
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }
}
