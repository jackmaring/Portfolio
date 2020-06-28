import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart';
import 'package:random_string/random_string.dart';

import 'package:sustainibility_project/locator.dart';
import 'package:sustainibility_project/providers/admin.dart';
import 'package:sustainibility_project/services/admin_api.dart';

class AdminCRUDModel extends ChangeNotifier {
  static final firestore = fb.firestore();
  CollectionReference adminEntriesRef = firestore.collection("admin_entries");
  fs.DocumentReference docRef =
      fs.Firestore.instance.collection('profile_entries').document();
  AdminApi _api = locator<AdminApi>();

  List<AdminDataTableEntry> adminDataEntries;

  // get admin data entries
  Future<List<AdminDataTableEntry>> fetchAdminDataEntries() async {
    var result = await _api.getDataCollection();
    adminDataEntries = result.documents
        .map((doc) => AdminDataTableEntry.fromMap(doc.data))
        .toList();
    return adminDataEntries;
  }

  // stream admin data entries
  Stream<fs.QuerySnapshot> fetchAdminDataEntriesAsStream() {
    return _api.streamDataCollection();
  }

  // get admin data entry by id
  Future<AdminDataTableEntry> getAdminDataEntriesById(String id) async {
    var doc = await _api.getDocumentById(id);
    return AdminDataTableEntry.fromMap(doc.data);
  }

  // remove admin data entry
  Future removeAdminDataEntry(String id) async {
    await _api.removeDocument(id);
    return;
  }

  // update admin data entry
  Future updateAdminDataEntry(AdminDataTableEntry data, String id) async {
    await _api.updateDocument(data.toMap(docRef.documentID), id);
    return;
  }

  // add admin data entry
  Future<String> addAdminDataEntry(AdminDataTableEntry data) async {
    String error;
    String randomString = randomAlphaNumeric(20);
    await adminEntriesRef
        .doc(randomString)
        .set(data.toMap(randomString))
        .catchError((e) {
      print(e);
      error = e.details;
      print(error);
    });
    return error;
  }
}
