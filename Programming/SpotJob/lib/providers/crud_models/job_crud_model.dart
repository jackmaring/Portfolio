import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:spotjob/providers/job.dart';
import 'package:spotjob/services/api.dart';

class JobCRUD extends ChangeNotifier {
  Api _api = Api('/jobs');

  List<Job> jobs;

  Future<List<Job>> fetchJobs() async {
    var result = await _api.getDataCollection();
    jobs = result.documents.map((doc) => Job.fromMap(doc.data)).toList();
    return jobs;
  }

  Stream<QuerySnapshot> fetchJobsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Job> getJobById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Job.fromMap(doc.data);
  }

  Future removeJob(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateJob(Job data, String id) async {
    await _api.updateDocument(data.toMap(), id);
    return;
  }

  Future addJob(Job data) async {
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
