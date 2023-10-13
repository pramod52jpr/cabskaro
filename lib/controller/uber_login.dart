import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class UberServices {
  final String clientSecret = 'FBaXl-qGp_v9XqyUxFy_1hkKEfLGBVQ8AcMkc1Ij';
  final String clientId = 'QNOjG96nSGFXRns6znQmCcZM8rQxmjej';
  final String scope = 'guests.trips';

  Future<void> generateAndStoreAccessToken() async {
    final Uri uri = Uri.parse('https://login.uber.com/oauth/v2/token');

    final Map<String, String> body = {
      'client_secret': clientSecret,
      'client_id': clientId,
      'grant_type': 'client_credentials',
      'scope': scope,
    };

    final response = await http.post(uri, body: body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final String accessToken = data['access_token'];
      await saveAccessToken(accessToken);
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  Future<void> saveAccessToken(String accessToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
  }
  
}
