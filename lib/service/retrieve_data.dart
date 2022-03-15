import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:razvojna/models/users.dart';

class RetrieveData {
  var url = Uri.parse('https://api4.allhours.com/api/v1/Users?userType=0');
  String access_token;

  RetrieveData(this.access_token);

  Map<String, String> get requestHeaders => {
        'authorization': 'Bearer $access_token',
        'content-type': 'application/json'
      };

  void getData() async {
    final response = await http.get(url, headers: requestHeaders);
    var decoded = jsonDecode(response.body);

    print(decoded);

    List users = [];

    decoded.forEach((element) {
      users.add(element['FirstName']);
      print(element['FirstName']);
    });
  }

  Future<Users> fetchUsers() async {
    final response = await http.get(url, headers: requestHeaders);
    var decoded = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Users.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
