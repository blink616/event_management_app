import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/events_model.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import './home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
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
    //print(events?.elementAt(0).description);
    
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
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
  final items = ['AIESEC', 'IEEE', 'NCBS', 'NMC', 'NCSC', 'NMX', 'ACM', 'NFAC'];
  DateTime selectedDate = DateTime.now();
  String? event_description;
  String? event_name;
  String? event_date;
  String? event_ticketprice;
  String? society_name;
  String? formattedDate;
  Iterable<EventModel>? events;
    File? _image;
  String? link;

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
      "ticket_price": event_ticketprice,
      "imageUrl": link
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

        final ImagePicker _picker = ImagePicker();
     Future getImage() async {
       var image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = File( image!.path );;
          print('Image Path $_image');
      });
    }

     Future uploadPic() async{
      String fileName = path.basename(_image!.path);
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(event_name.toString()).child(fileName);
      UploadTask uploadTask = firebaseStorageRef.putFile(_image!);   
      link = fileName;
      
    }
    return AlertDialog(
        title: Text("Create New Event"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              uploadPic();
              postDetailsToFirestore();
              Navigator.of(context).pop();
            },
            child: Text("Ok"),
          ),
        ],
        content: SingleChildScrollView(
            child: Column(children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Color(0xff476cfb),
                      child: ClipOval(
                        child: new SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child: (_image!=null)?Image.file(
                            _image!,
                            fit: BoxFit.fill,
                          ):Image.network(
                            "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera,
                        size: 30.0,
                      ),
                      onPressed: () {
                        getImage();
                      },
                    ),
                  ),
                ],
              )]),
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