import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreHelper {
  CloudFirestoreHelper._();

  static final CloudFirestoreHelper cloudFirestoreHelper =
      CloudFirestoreHelper._();

  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference notesRef;
  late CollectionReference countersRef;

  //connection with collection==================================================

  connectWithStudentsCollection() {
    notesRef = firebaseFirestore.collection('notes');
  }

  connectWithCountersCollection() {
    countersRef = firebaseFirestore.collection('counters');
  }

  //insert record===============================================================
  Future<void> insertRecord({
    required String title,
    required String data,
  }) async {
    connectWithStudentsCollection();
    connectWithCountersCollection();

    //fetch counter value from notes_counter collection
    DocumentSnapshot documentSnapshot =
        await countersRef.doc('notes_counter').get();

    Map<String, dynamic> datac =
        documentSnapshot.data() as Map<String, dynamic>;

    int counter = datac['counter'];

    //insert a new document with that fetched counter value

    await notesRef.doc("${++counter}").set({
      'title': title,
      'data': data,
    });

    print("**************************************");
    log(counter);
    //update the counter value in db

    countersRef.doc('notes_counter').set({'counter': counter});

    //second method---------------------

    //first method-----------------

    // Map<String, dynamic> data = {
    //   'name': 'Ram',
    //   'age': '18',
    //   'city': 'Ayodhya',
    // };

    // await studentsRef.add(data);
  }

  //select record===============================================================
  Stream<QuerySnapshot> selectRecords() {
    connectWithStudentsCollection();

    return notesRef.snapshots();
  }
  //update record===============================================================

  Future<void> updateRecord({
    required String id,
    required String title,
    required String data,
  }) async {
    connectWithStudentsCollection();

    await notesRef.doc(id).update({
      'title': title,
      'data': data,
    });
  }

  //delete record===============================================================

  Future<void> deleteRecord({required String id}) async {
    connectWithStudentsCollection();
    connectWithCountersCollection();

    await notesRef.doc(id).delete();
  }
}
