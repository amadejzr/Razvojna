import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:razvojna/models/users.dart';
import 'package:razvojna/service/retrieve_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<Users> users = <Users>[];
  List<Users> display = <Users>[];

  @override
  void initState() {
    // TODO: implement initState
    RetrieveData().fetchUsers().then((value) {
      setState(() {
        List<Users> users = <Users>[];
        users.addAll(value);
        display = users;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (display.isNotEmpty) {
          return _listItem(index);
        } else {
          return Center(
            child: MaterialButton(
              child: Text("test"),
              onPressed: () {
                RetrieveData().fetchUsers().then((value) {
                  users.addAll(value);
                  display = users;
                });

                print(display);
              },
            ),
          );
        }
      },
      itemCount: display.length,
    );
  }

  _listItem(index) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              display[index].firstName! + " " + display[index].lastName!,
            ),
            Text(
              display[index].email ?? 'Null',
            )
          ],
        ),
      ),
    );
  }
}
