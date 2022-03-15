import 'package:flutter/material.dart';
import 'package:razvojna/service/retrieve_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

void getData() async {
  final prefs = await SharedPreferences.getInstance();
  final String access_token = prefs.getString('access_token').toString();
  RetrieveData(access_token).getData();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {
            getData();
          },
          color: Colors.blue,
          child: const Text("Submit"),
        ),
      ],
    );
  }
}
