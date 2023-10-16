import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, dynamic>?> requestUberTripEstimates() async {
  final shared = await SharedPreferences.getInstance();

String? accessToken = shared.getString('access_token');

  final Uri uri = Uri.parse('https://api.uber.com/v1/guests/trips/estimates');

  final Map<String, dynamic> requestData = {
    "pickup": {"latitude": 40.7484, "longitude": -73.9857},
    "dropoff": {"latitude": 40.750568, "longitude": -73.993519}
  };

  final Map<String, String> headers = {
    'Authorization': 'Bearer $accessToken',
    'Content-Type': 'application/json',
  };

  final String requestBody = jsonEncode(requestData);

  final response = await http.post(uri, headers: headers, body: requestBody);

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseBody = json.decode(response.body);
    return responseBody;
  } else {
    print('API request failed with status: ${response.statusCode}');
    return null;
  }
}



