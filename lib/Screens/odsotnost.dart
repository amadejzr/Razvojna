import 'package:flutter/material.dart';

class Odsotnost extends StatefulWidget {
  final String uid;
  const Odsotnost({Key? key, required this.uid}) : super(key: key);

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
        body: Container(
            child: Column(
          children: <Widget>[
            Text(widget.uid),
          ],
        )));
  }
}
