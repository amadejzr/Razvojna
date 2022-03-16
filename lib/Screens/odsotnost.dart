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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Odsotnost"),
        ),
        body: Column(
          children: <Widget>[
            Text(widget.uid),
            MaterialButton(
              onPressed: () {
                for (var item in widget.absDef) {
                  if (item.name == widget.first) {
                    print(widget.uid);
                    print(item.id);
                    print(item.name);
                  }
                }
              },
              color: Colors.black,
            ),
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
          ],
        ));
  }
}
