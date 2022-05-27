

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import '../models/events_model.dart';
import "./EventPage.dart";

class EventList extends StatelessWidget {
  String? society;
  EventList({this.society});

  List<EventModel> events = [
    EventModel(
        name: "CARNIVAL NIGHT",
        description:
            "This event is by NLF. To all the NUSTIANS COME AND GRAP YOUR TICKETS BEFORE ITS TOO LATE",
        ticket_price: "1000",
        date: "11/12/2022",
        society_name: "NLF")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NUST HUB'),
      ),
      body: Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text('Society Listings',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0X0000FF))
          ),
          
        ),
        Expanded(
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (BuildContext ctx, int index) {
            return EventCard(
              event: events[index],
            );
          },
        ),
      )
      ]
          ),
    ));
  }
}

class EventCard extends StatelessWidget {
  EventModel? event;

  EventCard({this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
        onTap: () {
        
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  EventPage(event: event)),
            );
      },
      child: Container(
          margin: EdgeInsets.all(20),
          height: 150,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/society.jpg'),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent
                            ]))),
              ),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      // CategoryIcon(
                      //     color: this.category!.color,
                      //     iconName: this.category!.icon),
                      SizedBox(width: 10),
                      Text(this.event!.name!,
                          style: TextStyle(color: Colors.white, fontSize: 25))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
