// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nust_hub_1/models/events_model.dart';
import 'package:nust_hub_1/screens/EventList.dart';
import 'EventList.dart';
import "EventPage.dart";

class EventCard extends StatelessWidget {
  EventModel? event;

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
                  height: 140,
                  width: 140,
                  padding: EdgeInsets.all(0),
                  //margin: const EdgeInsets.only(
                  //  bottom: 30, left: 30, right: 30, top: 30),
                  //margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/society.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
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
