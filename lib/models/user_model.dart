class UserModel {
  String? uid;
  String? email;
  String? name;
  String? dept;
  String? about;
  List<String>? societies;

  UserModel({this.uid, this.email, this.name, this.dept, this.about, this.societies});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      dept: map['dept'],
      about: map['about'],
      societies: map['societies']
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'dept': dept,
      'about': about,
      'societies': societies,
    };
  }
}