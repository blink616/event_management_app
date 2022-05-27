import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nust_hub_1/models/events_model.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  EventModel? event;
  EventPage({this.event});

  @override
  State<EventPage> createState() => _EventPageState(event: event);
}

class _EventPageState extends State<EventPage> {
  EventModel? event;
  _EventPageState({this.event});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NUST HUB'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: Column(children: [
          SizedBox(height: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/society.jpg'),
          ),
          SizedBox(height: 5),
          Text(
            this.event!.name!,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 40,
                color: Colors.blueAccent),

          ),
          SizedBox(height: 10),
              Text(
                         "ABOUT",
                          style: TextStyle(
                
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Colors.blueAccent),
              ),
          
          
              SizedBox(height: 10),
              
              Container(
                width: 200,
                child: Expanded(
                  child: Text(

                            this.event!.description!,
                            style: TextStyle(
                              
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.blueAccent),
                    
                          ),
                ),
              ),
          
          
        
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calendar_month, color: Colors.blueAccent,),
              SizedBox(width: 10,),
              Text(
            this!.event!.date!,
            style: TextStyle(
              
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.blueAccent),
                
          ),
          ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.price_change, color: Colors.blueAccent,),
              SizedBox(width: 10,),
              Text(
            "Rs. " + this!.event!.ticket_price! + "/-",
            style: TextStyle(
              
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.blueAccent),
                
          ),
          ],
          ),
          SizedBox(height: 50),
          ElevatedButton(onPressed: (){}, 
          child: Text("Buy Tickets")
          )
          
          
        ])),
      ),
    );
  }
}
