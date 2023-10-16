import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UberServices {
  final String _clientSecret = 'FBaXl-qGp_v9XqyUxFy_1hkKEfLGBVQ8AcMkc1Ij';
  final String _clientId = 'QNOjG96nSGFXRns6znQmCcZM8rQxmjej';
  // final String _scope = 'profile trips';
  String? _accessToken; 

  Future<void> generateAndStoreAccessToken() async {
    final Uri uri = Uri.parse('https://login.uber.com/oauth/v2/token');
    final Map<String, String> body = {
      'client_secret': _clientSecret,
      'client_id': _clientId,
      'grant_type': 'client_credentials',
      // 'scope': _scope,
    };

    final response = await http.post(uri, body: body);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      _accessToken = data['access_token'];
      await _saveAccessToken(_accessToken);
      print('Access Token: $_accessToken'); 
    }

  else {
  if (response.statusCode == 400) {
  print('Request failed with status 400');
  print('Response body: ${response.body}');
}

 print('Request failed with status: ${response.statusCode}');
    }
  }

 Future<void> _saveAccessToken(String? accessToken) async {
 if (accessToken != null) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
    }
  }
}
