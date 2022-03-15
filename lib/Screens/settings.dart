import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:razvojna/service/httptoken.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final TextEditingController id = TextEditingController();
  final TextEditingController secret = TextEditingController();

  void clear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear().then((value) => print('success'));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                hintText: "id",
              ),
              controller: id,
            ),
            TextField(
              decoration: const InputDecoration(hintText: "Secret"),
              controller: secret,
            ),
            MaterialButton(
              onPressed: () {
                MyHttpService(id.text, secret.text).getToken();
              },
              color: Colors.blue,
              child: const Text("Submit"),
            )
          ],
        ));
  }
}
