import 'dart:async';
import 'package:flutter/material.dart';
import 'editPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  //variables
  var name = 'UME HANI';
  var email = 'email@email.edu.pk';
  var dept = 'SEECS';
  var about =
      'sd ul ;ewklfw kfl;wekfl;kwe l;fkll;rkfl;ewk fl;wkel;fk w el; ere';
  List<String> societies = <String>['NCSC', 'NMX', 'ACM', 'NFAC'];

  //function to create societies row
  Widget _buildRow(String sname) {
    return Container(
      height: 40,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.blue,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(0),
      child: Text(
        sname,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  //function to push edit page in navigator
  void editPageFunction() async{
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              EditPage(name: name, dept: dept, email: email, about: about)),
    );

    setState(() {
      name = result[0];
      email = result[1];
      dept = result[2];
      about = result[3];

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 250,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 90),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 150),
                      const CircleAvatar(
                        radius: 60.0,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(width: 5),
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.blue,
                        child: IconButton(
                          icon: const Icon(Icons.edit_outlined),
                          onPressed: editPageFunction,
                          tooltip: 'edit Page',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    name,
                    style: const TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ],
              ),
            ),
            //const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.only(
                  top: 10, left: 30, right: 30, bottom: 30),
              //height: 375,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 40,

                    //color: Colors.grey[200],
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                      //color: Colors.grey[200],
                      //color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.email,
                          ),
                          SizedBox(width: 5),
                          Text(email),
                          SizedBox(width: 20),
                          Text("|"),
                          SizedBox(width: 20),
                          const Icon(
                            Icons.house,
                          ),
                          SizedBox(width: 2),
                          Text(dept),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(10),
                    //height: 100,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Text('SOCIETIES',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 15),
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 20.0,
                          children: <Widget>[
                            for (var item in societies) _buildRow(item),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 1,
                      ),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.only(
                        top: 10, right: 15, left: 15, bottom: 30),
                    child: Column(
                      children: <Widget>[
                        Text('ABOUT',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 15),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                about,
                                textAlign: TextAlign.center,
                                maxLines: 5,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
