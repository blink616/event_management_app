// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nust_hub_1/screens/EventList.dart';
import 'EventList.dart';

class Societies extends StatefulWidget {
  const Societies({Key? key}) : super(key: key);

  @override
  State<Societies> createState() => _SocietiesState();
}

class _SocietiesState extends State<Societies> {
  @override
  Widget build(BuildContext context) {
    List<String> society = ["NMC", "Aisec", "ACM"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Society Listing',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: society.length,
              itemBuilder: (BuildContext ctx, int index) {
                return SocietyCard(society: society[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SocietyCard extends StatelessWidget {
  String? society;

  SocietyCard({this.society});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventList(society: society)),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top:10,left:10,right:10),
        margin: const EdgeInsets.only(bottom: 1),
        height: 170,

        child: Card(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                new BoxShadow(
                  color: Colors.black,
                  blurRadius: 6.0,
                  spreadRadius: 0.0, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 10  horizontally
                    5.0, // Move to bottom 10 Vertically
                  ),
                ),
              ],
              //border: Border.all(color: Colors.black, width: 1),
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(1), BlendMode.dstATop),
                image: AssetImage("assets/images/society.jpg"),
              ),
            ),
            child: Stack(
              children: [
                Text(
                  this.society!,
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 3,
                    fontFamily:'Teko',
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = Colors.black,
                  ),
                ),
                // The text inside
                Text(
                  this.society!,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily:'Teko',
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
