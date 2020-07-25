import 'dart:async';

import 'package:afaq/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataBaseRepo {
  // with ChangeNotifier {
  final String uid;
  UserDataBaseRepo({this.uid});

  // collection reference
  final CollectionReference userDataCollection =
      Firestore.instance.collection('users');
  Future updateUserData(User user) async {
    print(user.uid);
    return await userDataCollection.document(user.uid).setData(user.toJson());
  }

  // Stream profile(uid) {
  //   return userDataCollection.document(uid).snapshots();
  // }

  // Stream<List> profile(uid) {
  //   return userDataCollection.snapshots().map((snapshot) {
  //     return snapshot.documents.map((doc) => User.fromSnapshot(doc)).toList();
  //   });
  // }

  Future<User> profile(uid) async {
    print(5);
    DocumentSnapshot querySnapshot =
        await userDataCollection.document(uid).get();
    print(6);
    return User(
      firstname: querySnapshot.data["firstname"],
      email: querySnapshot.data["email"],
      city: querySnapshot.data["city"],
    );
  }
}
