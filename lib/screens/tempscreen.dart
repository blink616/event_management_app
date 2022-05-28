import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class tempscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 70),
      padding: const EdgeInsets.all(0),
      height: 1000.0,
      width: 500.0,
      // alignment: FractionalOffset.center,
      child: Column(
        //alignment:new Alignment(x, y)
        children: <Widget>[
          Container(
            height: 350,
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.all(
                Radius.circular(40.0),
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "CARNIVAL",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Colors.blueAccent),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Date:"),
              Text("22/22/2124"),
            ],
          ),
          SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left:20,right:20),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("SOCIETY: "),
                Text("NMX"),
                SizedBox(width: 20),
                Text("|"),
                SizedBox(width: 20),
                Text("TICKET PRICE: RS. "),
                Text("1000"),
              ],
            ),
          ),
          SizedBox(height: 40),
          Text(
            "ABOUT",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
          ),
          Container(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Text(
                    "This event is a entertainment event for nustians. They can buy food. There are swings to take rides on.",
                    softWrap: true,
                    maxLines:5,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          ElevatedButton(onPressed: (){},
              child: Text("Buy Tickets")
          )
        ],
      ),
    ));

    //Container(

    //  child: Container(
    //    height: 350,
    //    decoration: BoxDecoration(
    //      image: DecorationImage(
    //        image: AssetImage('assets/images/society.jpg'),
    //        fit: BoxFit.cover,
    //      ),
    //    ),
    //  ),
    //),
    //);
  }
}
