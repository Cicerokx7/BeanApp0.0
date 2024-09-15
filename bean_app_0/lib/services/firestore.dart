import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/data.dart';

class FirestoreService {

  // get collection of notes
  final CollectionReference data = FirebaseFirestore.instance.collection('data');

  // CREATE INITIAL DATA
  Future<void> createInitialData(List Note){
    return data.add({
      'standardCoffeeStack': 
    })
  }

  // CREATE
  Future<void> addNote(List note) {
    return data.add({
      'note': note,
      'timeStamp': Timestamp.now(),
    });
  }

  // READ
  Stream<QuerySnapshot> getDataStream() {
    final dataStream = data.orderBy('timeStamp', descending: true).snapshots();
    return dataStream;
  }

  // UPDATE
  // Future<void> updateData(List data) {
  //   return data.doc(docID).update({
  //     'note': data,
  //     'timestamp': Timestamp.now(),
  //   });
  // }

  //DELETE
}
