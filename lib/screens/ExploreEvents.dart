import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nust_hub_1/models/events_model.dart';
import 'package:nust_hub_1/screens/Events.dart';

class Explore extends StatelessWidget {
  Iterable<EventModel>? events;

  Future<Iterable<EventModel>?> getData() async {
    CollectionReference _collectionRef = FirebaseFirestore.instance
        .collection('events'); // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    await Future.delayed(const Duration(milliseconds: 100));
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    events = allData.map((e) => EventModel.fromMap(e));
    print("LMAO");
    print(events?.elementAt(0).description);
    return events;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Explore Events',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                if (asyncSnapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Expanded(
                      child: ListView.builder(
                          itemCount: events?.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return EventCard(
                              event: events?.elementAt(index),
                            );
                          }));
                }
              }),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return MyDialog();
              });
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}

class MyDialog extends StatefulWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  final items = ['ACM', 'NLF', 'NMC', 'AIESEC'];
  DateTime selectedDate = DateTime.now();
  String? event_description;
  String? event_name;
  String? event_date;
  String? event_ticketprice;
  String? society_name;
  String? formattedDate;
  Iterable<EventModel>? events;

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await Future.delayed(const Duration(milliseconds: 100));

    await firebaseFirestore.collection("events").add({
      "name": event_name,
      "society_name": society_name,
      "description": event_description,
      "date": formattedDate,
      "ticket_price": event_ticketprice
    });

    Fluttertoast.showToast(msg: "Event Added");
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2010),
        lastDate: DateTime(2025));

    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;

        formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
        print("Date: " + formattedDate!);
      });
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text("Create New Event"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              postDetailsToFirestore();
              Navigator.of(context).pop();
            },
            child: Text("Ok"),
          ),
        ],
        content: SingleChildScrollView(
            child: Column(children: [
          TextField(
            decoration: new InputDecoration(hintText: 'Event Name'),
            onChanged: (value) => setState(() {
              event_name = value;
            }),
          ),
          TextField(
            decoration: new InputDecoration(hintText: 'Description'),
            onChanged: (value) => setState(() {
              event_description = value;
            }),
          ),
          TextField(
            decoration: new InputDecoration(hintText: 'Ticket Price'),
            onChanged: (value) => setState(() {
              event_ticketprice = value;
            }),
          ),
          DropdownButton<String>(
              value: society_name,
              items: items.map(buildMenuItem).toList(),
              onChanged: (value) => setState(() => society_name = value)),
          ElevatedButton(
            onPressed: () {
              _selectDate(context);
            },
            child: Text("Choose Date"),
          ),
          Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}")
        ])));
  }
}
