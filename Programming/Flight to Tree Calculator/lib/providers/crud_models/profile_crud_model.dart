import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart';
import 'package:random_string/random_string.dart';

import 'package:sustainibility_project/locator.dart';
import 'package:sustainibility_project/providers/profile.dart';
import 'package:sustainibility_project/services/profile_api.dart';

class ProfileCRUDModel extends ChangeNotifier {
  static final firestore = fb.firestore();
  CollectionReference profileEntriesRef =
      firestore.collection("profile_entries");
  fs.DocumentReference docRef =
      fs.Firestore.instance.collection('profile_entries').document();
  ProfileApi _api = locator<ProfileApi>();

  List<ProfileDataTableEntry> profileDataEntries;

  // get profile data entries
  Future<List<ProfileDataTableEntry>> fetchProfileDataEntries() async {
    var result = await _api.getDataCollection();
    profileDataEntries = result.documents
        .map((doc) => ProfileDataTableEntry.fromMap(doc.data))
        .toList();
    return profileDataEntries;
  }

  // stream profile data entries
  Stream<fs.QuerySnapshot> fetchProfileDataEntriesAsStream() {
    return _api.streamDataCollection();
  }

  // get profile entry by id
  Future<ProfileDataTableEntry> getProfileDataEntriesById(String id) async {
    var doc = await _api.getDocumentById(id);
    return ProfileDataTableEntry.fromMap(doc.data);
  }

  // remove profile data entry
  Future removeProfileDataEntry(String id) async {
    await _api.removeDocument(id);
    return;
  }

  // update profile data entry
  Future updateProfileDataEntry(ProfileDataTableEntry data, String id) async {
    await _api.updateDocument(data.toMap(docRef.documentID), id);
    return;
  }

  // add profile data entry
  Future<String> addProfileDataEntry(ProfileDataTableEntry data) async {
    String error;
    String randomString = randomAlphaNumeric(20);
    await profileEntriesRef
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
