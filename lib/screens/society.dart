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
    List<String> society= [
    "NMC", "Aisec", "ACM"
  ];
    return Column(
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
            itemCount: society.length,
            itemBuilder: (BuildContext ctx, int index) {
              return SocietyCard(
                society: society[index]
                
                
              );
            },
          ),
        )
      ]
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
              MaterialPageRoute(builder: (context) =>  EventList(society: society)),
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
                    Text(this.society!,
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