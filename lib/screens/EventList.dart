

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/events_model.dart';
import "./EventPage.dart";
import 'package:nust_hub_1/screens/Events.dart';

class EventList extends StatelessWidget {
  String? society;
  EventList({this.society});
  
  

  
  Iterable<EventModel>? events;
  
  List<EventModel> filtered_events = [];
  @override
  

  Future<Iterable<EventModel>?> getData() async {

    
    CollectionReference _collectionRef = FirebaseFirestore.instance
        .collection('events'); // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    await Future.delayed(const Duration(milliseconds: 100));
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    events = allData.map((e) => EventModel.fromMap(e));
    
    events?.forEach((element) {
      if(element.society_name == society){
        filtered_events.add(element);
      };
    });
    //print(events?.elementAt(0).description);
    print(filtered_events);
    
    return filtered_events;
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text( society!.toString()),
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
                        itemCount: filtered_events.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return EventCard(
                            event: filtered_events.elementAt(index),

                          );

                        }));
              }
            }),
      ]));
  }
}

// class EventCard extends StatelessWidget {
//   EventModel? event;

//   EventCard({this.event});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(

//         onTap: () {

//         Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) =>  EventPage(event: event)),
//             );
//       },
//       child: Container(
//           margin: EdgeInsets.all(20),
//           height: 150,
//           child: Stack(
//             children: [
//               Positioned.fill(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image.asset('assets/images/society.jpg'),
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                     height: 120,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(20),
//                             bottomRight: Radius.circular(20)),
//                         gradient: LinearGradient(
//                             begin: Alignment.bottomCenter,
//                             end: Alignment.topCenter,
//                             colors: [
//                               Colors.black.withOpacity(0.7),
//                               Colors.transparent
//                             ]))),
//               ),
//               Positioned(
//                 bottom: 0,
//                 child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Row(
//                     children: [
//                       CategoryIcon(
//                           color: this.category!.color,
//                           iconName: this.category!.icon),
//                       SizedBox(width: 10),
//                       Text(this.event!.name!,
//                           style: TextStyle(color: Colors.white, fontSize: 25))
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           )),
//     );
//   }
// }
