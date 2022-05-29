class UserModel {
  String? uid;
  String? email;
  String? name;
  
  String? imageUrl;

  UserModel({this.uid, this.email, this.name, this.imageUrl});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      
      imageUrl: map['imageUrl'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      
      'imageUrl': imageUrl,
    };
  }
}