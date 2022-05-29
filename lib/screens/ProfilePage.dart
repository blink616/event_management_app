import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nust_hub_1/models/user_model.dart';
import 'editPage.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfilePage extends StatefulWidget {
  final UserModel? user;
  ProfilePage({this.user});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  


  

  //variables
  var name = 'UME HANI';
  var email = 'email@email.edu.pk';
  var dept = 'SEECS';
  var about =
      'Add long text hfkl sfsd dsf sdf sdf sdf sdf sdf sdf sdfd sfsd fsd fsd fsd fsd fsd fsd fsd fsdf sdf sdf sd fs fds ds fsd fds sglges fref ef wea fwe f wef wef wefwefwef wefwe f wef wef we fwe fwe f weewwfwe fwe f wef wef wef ew fwe fw ef wef we ef wef we fwe ef  r fl;flew;gwjgkewrjkge jrgk erkew lfkwel ;kfl;wekfl ;ewklfw kfl;wekfl;kwe l;fkll;rkfl;ewk fl;wkel;fk w el; ere';

  //function to create societies row
  String? _imageUrl;
   Future<String> downloadURL() async{
     print(widget.user!.name);
     print(widget.user!.imageUrl);
     final ref = await FirebaseStorage.instance.ref().child(widget.user!.name.toString()).child(widget.user!.imageUrl.toString());
     _imageUrl = await ref.getDownloadURL();
     print(_imageUrl);
     return _imageUrl.toString();
   }
   

void initState() {
  super.initState();
 
  
}


  
  
  Widget _buildRow(String sname) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: Text(sname),
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  //function to push edit page in navigator
  void editPageFunction() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              EditPage(name: widget.user?.name, dept: dept, email: email, about: about)),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 310,
              color: Colors.blue[500],
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 120),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 150),
                      ClipOval(
                        
                        child:      FutureBuilder(
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
            }),
                      ),
                      const SizedBox(width: 5),
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.edit_outlined),
                          onPressed: editPageFunction,
                          tooltip: 'Saved Suggestions',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Container(
                //color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.email,
                        ),
                        Text(email),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Divider(color: Colors.black),
                    const SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.house,
                        ),
                        Text(dept),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Divider(color: Colors.black),
                    const SizedBox(height: 15),
                    Row(
                      children: const <Widget>[
                        Text('ABOUT',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            about,
                            maxLines: 5,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Divider(color: Colors.black),
                    const SizedBox(height: 15),
                    Row(
                      children: const <Widget>[
                        Text("SOCIETIES",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    _buildRow('NCSC'),
                    _buildRow('NMX'),
                    _buildRow('NCSC'),
                    _buildRow('ACM'),
                    _buildRow('NMX'),
                    _buildRow('NCSC'),
                    _buildRow('ACM'),
                    const Divider(color: Colors.black),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



