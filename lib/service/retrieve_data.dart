import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:razvojna/models/abs_def.dart';
import 'package:razvojna/models/all_absences.dart';
import 'package:razvojna/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/absence.dart';

class RetrieveData {
  var urluser = Uri.parse('https://api4.allhours.com/api/v1/Users?userType=0');

  var urlAbsenceDef =
      Uri.parse('https://api4.allhours.com/api/v1/AbsenceDefinitions');

//Token
  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String accessToken = prefs.getString('access_token').toString();

    return accessToken;
  }

  List<AbsDef> parseAbsDef(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    var absdef = list.map((model) => AbsDef.fromJson(model)).toList();
    return absdef;
  }

  Future<List<AbsDef>> fetchAbsDef() async {
    String token = await getToken();
    final response = await http.get(urlAbsenceDef, headers: {
      'authorization': 'Bearer $token',
      'content-type': 'application/json'
    });
    if (response.statusCode == 200) {
      return compute(parseAbsDef, response.body);
    } else {
      Fluttertoast.showToast(
          msg: "Invalid token",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      return <AbsDef>[];
    }
  }

//Users
  List<Users> parseUsers(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    var users = list.map((model) => Users.fromJson(model)).toList();
    return users;
  }

  Future<List<Users>> fetchUsers() async {
    String token = await getToken();
    final response = await http.get(urluser, headers: {
      'authorization': 'Bearer $token',
      'content-type': 'application/json'
    });
    if (response.statusCode == 200) {
      return compute(parseUsers, response.body);
    } else {
      Fluttertoast.showToast(
          msg: "Invalid token",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      throw Exception('Error requesting data');
    }
  }

  Future<Absence> addAbsence(String userId, String absDefId, String comment,
      DateTime from, DateTime to) async {
    String token = await getToken();
    final response = await http.post(
      Uri.parse('https://api4.allhours.com/api/v1/Absences'),
      headers: <String, String>{
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'authorization': 'Bearer $token'
      },
      body: jsonEncode(<String, dynamic>{
        'userId': userId,
        "AbsenceDefinitionId": absDefId,
        "Comment": comment,
        "Timestamp": DateTime.now().toIso8601String(),
        "PartialTimeFrom": from.toIso8601String(),
        "PartialTimeTo": to.toIso8601String(),
      }),
    );
    if (response.statusCode == 201) {
      Fluttertoast.showToast(
          msg: "Odsotnost dodana",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      return Absence.fromJson(jsonDecode(response.body));
    } else {
      Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      throw Exception('Failed to create album.');
    }
  }

  List<AllAbsences> parseAllAbs(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    var allabs = list.map((model) => AllAbsences.fromJson(model)).toList();
    return allabs;
  }

  Future<List<AllAbsences>> fetchAllAbs() async {
    String token = await getToken();
    final response = await http
        .get(Uri.parse("https://api4.allhours.com/api/v1/Absences"), headers: {
      'authorization': 'Bearer $token',
      'content-type': 'application/json'
    });
    if (response.statusCode == 200) {
      return compute(parseAllAbs, response.body);
    } else {
      Fluttertoast.showToast(
          msg: "Invalid token",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      return <AllAbsences>[];
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

}
