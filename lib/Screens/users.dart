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

  bool loading = true;

  @override
  void initState() {
    RetrieveData().fetchUsers().then((value) {
      setState(() {
        loading = false;
        users.addAll(value);
        display = users;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              print("Add user");
            }),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: _searchBar()),
                    MaterialButton(
                      onPressed: () {
                        RetrieveData().fetchUsers().then((value) {
                          setState(() {
                            users = <Users>[];
                            display = <Users>[];
                            loading = false;
                            users.addAll(value);
                            display = users;
                          });
                        });
                      },
                      child: Icon(Icons.refresh),
                    ),
                  ],
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (!loading) {
                      return _listItem(index);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                  itemCount: display.length,
                ),
              ],
            ),
          ),
        ));
  }

  _searchBar() {
    return TextField(
      decoration: InputDecoration(hintText: 'Search'),
      onChanged: (text) {
        text = text.toLowerCase();
        setState(() {
          display = users.where((element) {
            var firstname = element.firstName!.toLowerCase();
            return firstname.contains(text);
          }).toList();
        });
      },
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
