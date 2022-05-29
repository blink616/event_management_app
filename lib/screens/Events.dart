// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nust_hub_1/models/events_model.dart';
import 'package:nust_hub_1/screens/EventList.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'EventList.dart';
import "EventPage.dart";

// class EventCard extends StatelessWidget {
//   EventModel? event;
//    String? _imageUrl;
//   Future<String> downloadURL() async{
//      print(event!.name);
//      print(event!.imageUrl);
//      final ref = await FirebaseStorage.instance.ref().child(event!.name.toString()).child(event!.imageUrl.toString());
//      _imageUrl = await ref.getDownloadURL();
//      print(_imageUrl);
//      return _imageUrl.toString();
//    }

//   EventCard({this.event});

//   void initState() {
//     print("EVENTS");
//     print(event);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => EventPage(event: event)),
//         );
//       },
//       child: Container(
//         height: 150,
//         margin: const EdgeInsets.only(
//             bottom: 10, left: 15, right: 15, top: 10),
//         decoration: BoxDecoration(

//           boxShadow: [
//             new BoxShadow(
//               color: Colors.black,
//               blurRadius: 3.0,
//               spreadRadius: 0, //extend the shadow
//               offset: Offset(
//                 3.0, // Move to right 10  horizontally
//                 3.0, // Move to bottom 10 Vertically
//               ),
//             ),
//           ],
//         ),
//         child: Container(
//             color: Colors.white,

//             child:Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(width:10),
//             Container(
//               height: 140,
//               width: 140,
//               padding: EdgeInsets.all(0),

              

                
//                   child: FutureBuilder(
//             future: downloadURL(),
//             builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
//               if (asyncSnapshot.data == null) {
//                 return const Center(child: CircularProgressIndicator());
//               } else {
//                 return Expanded(
//                     child: Image.network(_imageUrl.toString(),
//                     width: 100,
//                     height: 100,));
//               }
//             }) 
//              ,
              
//             ),
//             SizedBox(width:10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//               SizedBox(height:10),
//               SizedBox(width: 10,),
//               Row(

//                 children: <Widget>[Text(
//                   this.event!.name!,
//                   style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 25,
//                       color: Colors.black,
//                       fontFamily: 'Teko'),
//                 ),],
//               ),
//               Row(children: <Widget>[
//                 Icon(
//                   Icons.calendar_month,
//                   color: Colors.blueAccent,
//                 ),
//                 Text(this!.event!.date!),
//               ],)
//             ],)
//           ],
//         )),
//       ),
//     );
//   }
// }





class EventCard extends StatelessWidget {
 EventModel? event;
   String? _imageUrl;
  Future<String> downloadURL() async{
     
     
     final ref = await FirebaseStorage.instance.ref().child(event!.name.toString()).child(event!.imageUrl.toString());
     _imageUrl = await ref.getDownloadURL();
     
     return _imageUrl.toString();
   }

  EventCard({this.event});

  void initState() {
    print("EVENTS");
    print(event);
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventPage(event: event)),
        );
      },
      child: Container(
        height: 150,
        padding: EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15, top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.blue,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 10),
                Container(
                  height: 120,
                  width: 120,
                  padding: EdgeInsets.all(0),
                  //margin: const EdgeInsets.only(
                  //  bottom: 30, left: 30, right: 30, top: 30),
                  //margin: const EdgeInsets.all(30),
                  
                  child: FutureBuilder(
            future: downloadURL(),
            builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
              if (asyncSnapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Expanded(
                    child: Image.network(_imageUrl.toString(),
                    width: 100,
                    height: 100,));
              }
            }) 
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text(
                          this.event!.name!,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.black,
                              //fontFamily: 'Teko'
                            ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_month,
                          color: Colors.blueAccent,
                        ),
                        Text(this!.event!.date!),
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}