import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  final String firstname;
  final String email;
  final String city;
  // final String secondname;
  // final String role;
  // final String phone;

  User({
    this.uid,
    this.firstname,
    this.email,
    this.city,
  });

  static User fromData(Map<String, dynamic> map) {
    if (map == null) return null;
    print("$map['firstname'],$map['role'],$map['email']");
    return User(
      uid: map['uid'],
      firstname: map['firstname'],
      email: map['email'],
      city: map['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      "firstname": firstname,
      "email": email,
      "city": city,
    };
  }

  static User fromSnapshot(DocumentSnapshot snap) {
    return User(
      uid: snap.data['uid'],
      firstname: snap.data['firstname'],
      email: snap.data['email'],
      city: snap.data['city'],
    );
  }
}
