import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyHttpService {
  String clientId;
  String clientSecret;
  var url = Uri.parse('https://login.allhours.com/connect/token');

  MyHttpService(this.clientId, this.clientSecret);

  void getToken() async {
    final prefs = await SharedPreferences.getInstance();
    var response = await http.post(url, body: {
      'grant_type': 'client_credentials',
      'client_id': clientId,
      'client_secret': clientSecret,
      'scope': 'api'
    });
    var decoded = jsonDecode(response.body);

    if (response.statusCode == 200) {
      prefs.setString('access_token', decoded['access_token']);
      prefs.setString('expires_in', decoded['expires_in'].toString());
      print('sucesss');
    } else {
      throw Exception('Failed');
    }
  }
}
