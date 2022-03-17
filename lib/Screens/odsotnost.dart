import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razvojna/models/abs_def.dart';
import 'package:razvojna/service/retrieve_data.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
  DateRangePickerController _datePickerController = DateRangePickerController();
  late String startDate = "", endDate = "";

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
                SfDateRangePicker(
                  selectionMode: DateRangePickerSelectionMode.range,
                  controller: _datePickerController,
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs args) {
                    startDate = args.value.startDate.toString();
                    endDate = args.value.endDate.toString();
                  },
                ),
                MaterialButton(
                  onPressed: () {
                    if (startDate.isEmpty && endDate.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Choose dates",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          fontSize: 16.0);
                    } else {
                      if (endDate == "null") {
                        endDate = startDate;
                      }
                      for (var item in widget.absDef) {
                        if (item.name == widget.first) {
                          RetrieveData()
                              .addAbsence(
                                widget.uid,
                                item.id.toString(),
                                commentController.text,
                                DateTime.parse(startDate),
                                DateTime.parse(endDate),
                              )
                              .whenComplete(() => Navigator.pop(context));
                        }
                      }
                    }
                  },
                  color: Colors.blue,
                  child: const Text("Add absence"),
                ),
              ],
            ),
          ),
        ));
  }
}
