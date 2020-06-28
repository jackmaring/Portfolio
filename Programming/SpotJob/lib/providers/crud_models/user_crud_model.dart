import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:spotjob/providers/user.dart';
import 'package:spotjob/services/api.dart';

class UserCRUD extends ChangeNotifier {
  Api _api = Api('/users');

  List<User> users;

  Future<List<User>> fetchUsers() async {
    var result = await _api.getDataCollection();
    users = result.documents.map((doc) => User.fromMap(doc.data)).toList();
    return users;
  }

  Stream<QuerySnapshot> fetchUsersAsStream() {
    return _api.streamDataCollection();
  }

  Future<User> getUserById(String id) async {
    var doc = await _api.getDocumentById(id);
    return User.fromMap(doc.data);
  }

  Future removeUser(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateUser(User data, String id) async {
    await _api.updateDocument(data.toMap(), id);
    return;
  }

  Future addUser(User data) async {
    await _api
        .addDocument(data.toMap())
        .then((result) => {
              data.id = result.documentID,
              result.setData({'id': data.id}, merge: true)
            })
        .catchError((e) => {print(e.message)});
    return;
  }
}
