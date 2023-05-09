import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectFirestore {
  var db;

  ProjectFirestore() {
    db = FirebaseFirestore.instance;
  }

  Future<void> addDocument(
      {required String collectionPath,
      required Map<String, dynamic> document}) async {
    final data = {"name": "Tokyo", "country": "Japan"};

    db.collection(collectionPath).add(document).then((documentSnapshot) =>
        print("Added Data with ID: ${documentSnapshot.id}"));
  }

  Future<void> updateDocument(
      {required String path,
      required String docID,
      required Map<String, dynamic> newData}) async {
    final docRef = db.collection(path).doc(docID);
    docRef.update(newData).then(
        (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));
  }

  Future<void> deleteDocument(
      {required String path, required String docID}) async {
    db.collection(path).doc(docID).delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
  }

  Future<Map<String, dynamic>> readSingleDocument(
      {required String path, required String docID}) async {
    final docRef = db.collection(path).doc(docID);
    Map<String, dynamic> data = {};
    docRef.get().then(
      (DocumentSnapshot doc) {
        data = doc.data() as Map<String, dynamic>;
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return data;
  }

  Future<List<Map<String, dynamic>>> readMultipleDocuments(
      {required String collectionPath}) async {
    List<Map<String, dynamic>> documentMaps = [];
    db.collection(collectionPath).get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          documentMaps.add(docSnapshot.data() as Map<String, dynamic>);
          print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
      },
      onError: (e) => print("Error completing: $e"),
    );

    return documentMaps;
  }
}
