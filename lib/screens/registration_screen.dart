// // ignore_for_file: unnecessary_new

// import 'dart:io';
// import 'package:path/path.dart' as path;
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/user_model.dart';
// import './home.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

// class RegistrationScreen extends StatefulWidget {
//   const RegistrationScreen({Key? key}) : super(key: key);

//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }

// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final _auth = FirebaseAuth.instance;

//   // string for displaying the error Message
//   String? errorMessage;

//   // our form key
//   final _formKey = GlobalKey<FormState>();

//   // editing Controller
//   final NameEditingController = TextEditingController();
//   final secondNameEditingController = TextEditingController();
//   final deptEditingController = TextEditingController();
//   final emailEditingController = TextEditingController();
//   final aboutEditingController = TextEditingController();
//   final passwordEditingController = TextEditingController();
//   final confirmPasswordEditingController = TextEditingController();
//   File? _image;
//   String? link;
//   @override
//   Widget build(BuildContext context) {
//     final ImagePicker _picker = ImagePicker();
//      Future getImage() async {
//        var image = await _picker.pickImage(source: ImageSource.gallery);
//       setState(() {
//         _image = File( image!.path );;
//           print('Image Path $_image');
//       });
//     }

//      Future uploadPic(BuildContext context) async{
//       String fileName = path.basename(_image!.path);
//       FirebaseStorage storage = FirebaseStorage.instance;
//       Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(NameEditingController.text.toString()).child(fileName);
//       UploadTask uploadTask = firebaseStorageRef.putFile(_image!);       
//       link = fileName;

//     }

//    final imageField = Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(
//                 height: 20.0,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Align(
//                     alignment: Alignment.center,
//                     child: CircleAvatar(
//                       radius: 100,
//                       backgroundColor: Color(0xff476cfb),
//                       child: ClipOval(
//                         child: new SizedBox(
//                           width: 180.0,
//                           height: 180.0,
//                           child: (_image!=null)?Image.file(
//                             _image!,
//                             fit: BoxFit.fill,
//                           ):Image.network(
//                             "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 60.0),
//                     child: IconButton(
//                       icon: Icon(
//                         Icons.camera,
//                         size: 30.0,
//                       ),
//                       onPressed: () {
//                         getImage();
//                       },
//                     ),
//                   ),
//                 ],
//               )]);
//     //first name field
//     final NameField = TextFormField(
//         autofocus: false,
//         controller: NameEditingController,
//         keyboardType: TextInputType.name,
//         validator: (value) {
//           RegExp regex = RegExp(r'^.{3,}$');
//           if (value!.isEmpty) {
//             return ("First Name cannot be Empty");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("Enter Valid name(Min. 3 Character)");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           NameEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           hintText: "First Name",
//         ));
        

//     //second name field
//     final secondNameField = TextFormField(
//         autofocus: false,
//         controller: secondNameEditingController,
//         keyboardType: TextInputType.name,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return ("Second Name cannot be Empty");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           secondNameEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           hintText: "Second Name",
//         ));

//     //dept field
//     final deptField = TextFormField(
//         autofocus: false,
//         controller: deptEditingController,
//         keyboardType: TextInputType.name,
//         validator: (value) {
//           RegExp regex = RegExp(r'^.{3,}$');
//           if (value!.isEmpty) {
//             return ("Department cannot be Empty");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("Enter Valid Department(Min. 3 Character)");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           deptEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           hintText: "Department",
//         ));

//     //dept field
//     final aboutField = TextFormField(
//         autofocus: false,
//         controller: aboutEditingController,
//         keyboardType: TextInputType.name,
//         validator: (value) {
//           RegExp regex = RegExp(r'^.{10,}$');
//           if (value!.isEmpty) {
//             return ("About cannot be Empty");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("Enter Valid About(Min. 10 Character)");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           deptEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           hintText: "About",

//         ));

//     //email field
//     final emailField = TextFormField(
//         autofocus: false,
//         controller: emailEditingController,
//         keyboardType: TextInputType.emailAddress,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return ("Please Enter Your Email");
//           }
//           // reg expression for email validation
//           if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//               .hasMatch(value)) {
//             return ("Please Enter a valid email");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           NameEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           hintText: "Email",
//         ));

//     //password field
//     final passwordField = TextFormField(
//         autofocus: false,
//         controller: passwordEditingController,
//         obscureText: true,
//         validator: (value) {
//           RegExp regex = RegExp(r'^.{6,}$');
//           if (value!.isEmpty) {
//             return ("Password is required for login");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("Enter Valid Password(Min. 6 Character)");
//           }
//         },
//         onSaved: (value) {
//           NameEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           hintText: "Password",
//         ));

//     //confirm password field
//     final confirmPasswordField = TextFormField(
//         autofocus: false,
//         controller: confirmPasswordEditingController,
//         obscureText: true,
//         validator: (value) {
//           if (confirmPasswordEditingController.text !=
//               passwordEditingController.text) {
//             return "Password don't match";
//           }
//           return null;
//         },
//         onSaved: (value) {
//           confirmPasswordEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.done,
//         decoration: InputDecoration(
//           hintText: "Confirm Password",
//         ));

//     //signup button
//     final signUpButton = Material(
//       elevation: 5,
//       child: MaterialButton(
//           padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//           minWidth: MediaQuery.of(context).size.width,
//           color: Colors.black,
//           onPressed: ()  async {
//             await uploadPic(context);
//            signUp(emailEditingController.text, passwordEditingController.text);
            

//           },
//           child: const Text(
//             "SignUp",
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 20, color: Colors.white),
//           )),
//     );

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             // passing this to our root
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(36.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     imageField,
//                     const SizedBox(height: 45),
//                     NameField,
//                     const SizedBox(height: 20),
//                     secondNameField,
//                     const SizedBox(height: 20),
//                     deptField,
//                     const SizedBox(height: 20),
//                     emailField,
//                     const SizedBox(height: 20),
//                     aboutField,
//                     const SizedBox(height: 20),
//                     passwordField,
//                     const SizedBox(height: 20),
//                     confirmPasswordField,
//                     const SizedBox(height: 20),
//                     signUpButton,
//                     const SizedBox(height: 15),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void signUp(String email, String password) async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await _auth
//             .createUserWithEmailAndPassword(email: email, password: password)
//             .then((value) => {postDetailsToFirestore()})
//             .catchError((e) {
//           Fluttertoast.showToast(msg: e!.message);
//         });
//       } on FirebaseAuthException catch (error) {
//         switch (error.code) {
//           case "invalid-email":
//             errorMessage = "Your email address appears to be malformed.";
//             break;
//           case "wrong-password":
//             errorMessage = "Your password is wrong.";
//             break;
//           case "user-not-found":
//             errorMessage = "User with this email doesn't exist.";
//             break;
//           case "user-disabled":
//             errorMessage = "User with this email has been disabled.";
//             break;
//           case "too-many-requests":
//             errorMessage = "Too many requests";
//             break;
//           case "operation-not-allowed":
//             errorMessage = "Signing in with Email and Password is not enabled.";
//             break;
//           default:
//             errorMessage = "An undefined Error happened.";
//         }
//         Fluttertoast.showToast(msg: errorMessage!);
//         print(error.code);
//       }
//     }
//   }

//   postDetailsToFirestore() async {
//     // calling our firestore
//     // calling our user model
//     // sedning these values

//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     User? user = _auth.currentUser;

//     UserModel userModel = UserModel();

//     // writing all the values
//     userModel.email = user!.email;
//     userModel.uid = user.uid;
//     userModel.Name = NameEditingController.text;
//     userModel.secondName = secondNameEditingController.text;
//     userModel.imageUrl = link;

//     await firebaseFirestore
//         .collection("users")
//         .doc(user.uid)
//         .set(userModel.toMap());
//     Fluttertoast.showToast(msg: "Account created successfully :) ");

//     Navigator.pushAndRemoveUntil(
//         (context),
//         MaterialPageRoute(builder: (context) =>  Home(user: userModel)),
//         (route) => false);
//     print("it Runs");
//   }
// }








import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import './home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();

  // editing Controller
  final nameEditingController = TextEditingController();
  final deptEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final aboutEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  //dropdown of societies
  final items = ['SEECS', 'NBS', 'S3H', 'SMME', 'SADA', 'SCME'];
  var dept_name;

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));

    File? _image;
  String? link;
  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();
     Future getImage() async {
       var image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = File( image!.path );;
          print('Image Path $_image');
      });
    }

     Future uploadPic(BuildContext context) async{
      String fileName = path.basename(_image!.path);
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(nameEditingController.text.toString()).child(fileName);
      UploadTask uploadTask = firebaseStorageRef.putFile(_image!);       
      link = fileName;
    }
     final imageField = Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Color(0xff476cfb),
                      child: ClipOval(
                        child: new SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child: (_image!=null)?Image.file(
                            _image!,
                            fit: BoxFit.fill,
                          ):Image.network(
                            "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera,
                        size: 30.0,
                      ),
                      onPressed: () {
                        getImage();
                      },
                    ),
                  ),
                ],
              )]);
    //first name field
    final NameField = TextFormField(
        autofocus: false,
        controller: nameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          nameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Name",
        ));

    //second name field
    //dept field
    final aboutField = TextFormField(
        autofocus: false,
        controller: aboutEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^.{10,}$');
          if (value!.isEmpty) {
            return ("About cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid About(Min. 10 Character)");
          }
          return null;
        },
        onSaved: (value) {
          deptEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "About",
        ));

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          nameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Email",
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          nameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Password",
        ));

    //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: "Confirm Password",
        ));

    //signup button
    final signUpButton = Material(
      elevation: 5,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          color: Colors.black,
          onPressed: () {
            uploadPic(context);
            signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: const Text(
            "SignUp",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    imageField,
                    const SizedBox(height: 15),
                    NameField,
                    const SizedBox(height: 15),
                    
                    const SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Text("Select Department: ",
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Container(
                          padding: EdgeInsets.only(right:20,left:20),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                  value: dept_name,
                                  items: items.map(buildMenuItem).toList(),
                                  onChanged: (value) =>
                                      setState(() => dept_name = value)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Colors.black,),
                    
                    const SizedBox(height: 10),
                    emailField,
                    const SizedBox(height: 20),
                    aboutField,
                    const SizedBox(height: 20),
                    passwordField,
                    const SizedBox(height: 20),
                    confirmPasswordField,
                    const SizedBox(height: 20),
                    signUpButton,
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameEditingController.text;
    userModel.imageUrl = link;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) =>  Home(user: userModel)),
        (route) => false);
    print("it Runs");
  }
}