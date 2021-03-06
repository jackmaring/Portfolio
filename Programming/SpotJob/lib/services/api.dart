import 'package:cloud_firestore/cloud_firestore.dart';

class Api {
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;

  Api(this.path) {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }

  Future<DocumentSnapshot> getDocumentByAccountId(String accountId) async {
    QuerySnapshot query =
        await ref.where("accountId", isEqualTo: accountId).getDocuments();
    List<DocumentSnapshot> documents = query.documents;
    return documents[0];
  }

  Future<void> removeDocument(String id) {
    return ref.document(id).delete();
  }

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }

  Future addDocumentWithId(String id, Map data) async {
    await ref.document(id).setData(data);
    return;
  }

  Future<void> updateDocument(Map data, String id) {
    return ref.document(id).updateData(data);
  }
}
