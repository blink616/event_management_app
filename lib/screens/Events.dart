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
          margin: const EdgeInsets.only(bottom:20, left:20, right:20, top:30),
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(
              Radius.circular(10.0),
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/society.jpg'),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              new BoxShadow(
                color: Colors.black,
                blurRadius: 6.0,
                spreadRadius: 0, //extend the shadow
                offset: Offset(
                  5.0, // Move to right 10  horizontally
                  5.0, // Move to bottom 10 Vertically
                ),
              ),
            ],
          ),
          child: Column(

                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    this.event!.name!,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        color: Colors.white, fontFamily: 'Teko'),
                  ),

            ],
          )),

    );
  }
}
