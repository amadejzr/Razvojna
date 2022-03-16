import 'package:flutter/material.dart';
import 'package:razvojna/models/abs_def.dart';
import 'package:razvojna/service/retrieve_data.dart';

class Odsotnost extends StatefulWidget {
  final String uid;
  final List<AbsDef> absDef;
  String first;
  Odsotnost(
      {Key? key, required this.uid, required this.absDef, required this.first})
      : super(key: key);

  @override
  State<Odsotnost> createState() => _OdsotnostState();
}

class _OdsotnostState extends State<Odsotnost> {
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Odsotnost"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: <Widget>[
                DropdownButton(
                  // Initial Value
                  value: widget.first,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: widget.absDef.map((var items) {
                    return DropdownMenuItem(
                      value: items.name,
                      child: Text(items.name!),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      widget.first = newValue!;
                    });
                  },
                ),
                TextField(
                  controller: commentController,
                  decoration: const InputDecoration(hintText: "Comment"),
                ),
                MaterialButton(
                  onPressed: () {
                    for (var item in widget.absDef) {
                      if (item.name == widget.first) {
                        RetrieveData().createAlbum(
                            widget.uid,
                            item.id.toString(),
                            commentController.text,
                            DateTime.now(),
                            DateTime.now());
                      }
                    }
                  },
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ));
  }
}
