import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razvojna/models/all_absences.dart';
import 'package:razvojna/service/retrieve_data.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';

class Absences extends StatefulWidget {
  const Absences({Key? key}) : super(key: key);

  @override
  State<Absences> createState() => _AbsencesState();
}

class _AbsencesState extends State<Absences> {
  late String _selectedDate = "";
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  List<AllAbsences> absences = <AllAbsences>[];

  late DateTime from, to, selected;
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Center(
          child: Column(
        children: <Widget>[
          MaterialButton(
            child: _selectedDate == ""
                ? const Text("Select date")
                : Text(formatter.format(DateTime.parse(_selectedDate))),
            color: Colors.blue,
            onPressed: () {
              showDialog<Widget>(
                  context: context,
                  builder: (BuildContext context) {
                    return SfDateRangePicker(
                      backgroundColor: Colors.white,
                      showActionButtons: true,
                      onSubmit: (value) {
                        absences = <AllAbsences>[];
                        _selectedDate = value.toString();
                        if (value != null) {
                          RetrieveData().fetchAllAbs().then((value) {
                            for (var item in value) {
                              if (item.partialTimeFrom != null &&
                                  item.partialTimeFrom != null &&
                                  _selectedDate != "") {
                                from = DateTime.parse(item.partialTimeFrom!);
                                to = DateTime.parse(item.partialTimeTo!);
                                selected = DateTime.parse(_selectedDate);
                                if (from.isBefore(selected) &&
                                    to.isAfter(selected)) {
                                  absences.add(item);
                                }
                              }
                            }
                            setState(() {});
                          }).whenComplete(() {
                            setState(() {});
                            Navigator.pop(context);
                          });
                        } else {
                          Fluttertoast.showToast(
                              msg: "Select date",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              fontSize: 16.0);
                        }
                      },
                      onCancel: () {
                        Navigator.pop(context);
                      },
                    );
                  });
            },
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _listItem(index);
            },
            itemCount: absences.length,
          ),
        ],
      )),
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
                  absences[index].firstName! + " " + absences[index].lastName!,
                ),
                Text(absences[index].absenceDefinitionName!)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
