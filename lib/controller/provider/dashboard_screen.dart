// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class DashboardScreenProvider extends ChangeNotifier {
//   final  String STARTLOC = "start";
//   final  String STARTLAT = "startLat";
//   final  String STARTLON = "startLon";
//   final  String ENDLOC = "end";
//   final  String ENDLAT = "endLat";
//   final  String ENDLON = "endLon";
//   String startLocationName = "Pickup Location";
//   double startLatitude = 0.0;
//   double startLongitude = 0.0;
//   String endLocationName = "Destination Location";
//   double endLatitude = 0.0;
//   double endLongitude = 0.0;
//   double zoom = 1.0;
//   List<Marker> marker = [];
//   PolylinePoints polylinePoints = PolylinePoints();
//   Map<PolylineId, Polyline> polylines = {};


//   void animateStartLocation(double latitude, double longitude) {
//     startLatitude = latitude;
//     startLongitude = longitude;
//     startLocationName = "Current Location";
//     notifyListeners();
//   }


//   void animateEndLocation(double latitude, double longitude) {
//     endLatitude = latitude;
//     endLongitude = longitude;
//     endLocationName = "Destination Location";
//     notifyListeners();

//   }
// }
