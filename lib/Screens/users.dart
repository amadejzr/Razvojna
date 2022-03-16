import 'package:flutter/material.dart';
import 'package:razvojna/Screens/odsotnost.dart';
import 'package:razvojna/models/abs_def.dart';

import 'package:razvojna/models/users.dart';
import 'package:razvojna/service/retrieve_data.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<Users> users = <Users>[];
  List<Users> display = <Users>[];
  bool loading = true;

  /*@override
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



   RetrieveData().fetchAbsDef().then((value) {
        for (var item in value) {
          absDef.add(item.name!);
        }
      }).whenComplete(() => print("HAHAH"));
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              _showModalBottomSheet(context);
            }),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
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
                      child: const Icon(Icons.refresh),
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
                      return const Center(child: CircularProgressIndicator());
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
      decoration: const InputDecoration(hintText: 'Search'),
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
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
            MaterialButton(
              onPressed: () {
                String id = display[index].id!;
                List<AbsDef> absDef = <AbsDef>[];

                RetrieveData().fetchAbsDef().then((value) {
                  for (var item in value) {
                    absDef.add(item);
                  }
                }).whenComplete(() {
                  if (absDef.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Odsotnost(
                                uid: id,
                                absDef: absDef,
                                first: absDef.first.name!,
                              )),
                    );
                  } else {
                    print("Not valid token");
                  }
                });
              },
              child: const Text("Odsotnost"),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}

_showModalBottomSheet(context) {
  Size size = MediaQuery.of(context).size;
  final TextEditingController firstEditing = TextEditingController();
  final TextEditingController lastEditing = TextEditingController();
  final TextEditingController emailEditing = TextEditingController();

  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) => Container(
            height: size.height * 0.8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(hintText: "First name"),
                    controller: firstEditing,
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: "Last name"),
                    controller: lastEditing,
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: "Email"),
                    controller: emailEditing,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.blue,
                    child: const Text("Add user"),
                  )
                ],
              ),
            ),
          ));
}
