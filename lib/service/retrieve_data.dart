import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:razvojna/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RetrieveData {
  var url = Uri.parse('https://api4.allhours.com/api/v1/Users?userType=0');
  RetrieveData();

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String access_token = prefs.getString('access_token').toString();

    return access_token;
  }

  /*Map<String, String> get requestHeaders =>
      {'authorization': 'Bearer $haha', 'content-type': 'application/json'};
*/

  List<Users> parseData(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    var users = list.map((model) => Users.fromJson(model)).toList();
    return users;
  }

  Future<List<Users>> fetchUsers() async {
    String token = await getToken();
    final response = await http.get(url, headers: {
      'authorization': 'Bearer $token',
      'content-type': 'application/json'
    });

    if (response.statusCode == 200) {
      print('sucess');
      return compute(parseData, response.body);
    } else {
      throw Exception('Error requesting data');
    }
  }
}


  /*Future<Users> fetchUsers() async {
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
*/

/*var decoded = jsonDecode(response.body);
   

    print(decoded);

    List users = [];

    decoded.forEach((element) {
      users.add(element['FirstName']);
      print(element['FirstName']);
    });
    */


