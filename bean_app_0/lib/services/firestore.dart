import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/cup.dart';
import '../data/data.dart';

class FirestoreService {
  // get collection of notes
  final CollectionReference data =
      FirebaseFirestore.instance.collection('data');

  // CREATE INITIAL DATA
  Future<void> createInitialData(){
    //Make this work only if there is no data in the collection.
    // if (data.count() == 0) {
       return data.add({
        'standardCoffeeStack': [
          Cup(
            custom: false,
            heat: 80,
            espresso: 0.2,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.1,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.3,
            milkFoam: 0.3,
            wholeMilk: true,
            empty: 0.1,
            title: "Orange Mocha Frappucino",
            description:
                "Is there anything more to life than being really really really ridiculously good looking? You know what can help you sort through this important issue? ORANGE MOCHA FRAPPUCINO!!!",
          ),
          Cup(
            custom: false,
            heat: 80,
            espresso: 0.2,
            caffeinated: false,
            hotWater: 0.2,
            syrupOne: 0.0,
            syrupTwo: 0.2,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            milkFoam: 0.3,
            wholeMilk: false,
            empty: 0.1,
            title: "Pinkidy Dinkidy",
          ),
          Cup(
            custom: false,
            heat: 80,
            espresso: 0.0,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            milkFoam: 0.0,
            wholeMilk: true,
            empty: 1.0,
            title: "3",
          ),
          Cup(
            custom: false,
            heat: 80,
            espresso: 0.0,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            milkFoam: 0.0,
            wholeMilk: true,
            empty: 1.0,
            title: "4",
          ),
          Cup(
            custom: false,
            heat: 80,
            espresso: 0.0,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            wholeMilk: true,
            milkFoam: 0.0,
            empty: 1.0,
            title: "5",
          ),
          Cup(
            custom: false,
            heat: 80,
            espresso: 0.0,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            wholeMilk: true,
            milkFoam: 0.0,
            empty: 1.0,
            title: "6",
          ),
          Cup(
            custom: false,
            heat: 80,
            espresso: 0.0,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            wholeMilk: true,
            milkFoam: 0.0,
            empty: 1.0,
            title: "7",
          ),
        ],
        'recentCoffeeStack': [
          Cup(
            custom: false,
            heat: 80,
            espresso: 0.2,
            caffeinated: true,
            hotWater: 0.2,
            syrupOne: 0.0,
            syrupTwo: 0.2,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            wholeMilk: true,
            milkFoam: 0.3,
            empty: 0.1,
            title: "Pinkidy Dinkidy",
          ),
          Cup(
            custom: true,
            heat: 80,
            espresso: 0.2,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.1,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.3,
            wholeMilk: false,
            milkFoam: 0.3,
            empty: 0.1,
            title: "Orange Mocha Frappucino",
            description:
                "Is there anything more to life than being really really really ridiculously good looking? You know what can help you sort through this important issue? ORANGE MOCHA FRAPPUCINO!!!",
          ),
          Cup(
            custom: false,
            heat: 80,
            espresso: 0.0,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            milkFoam: 0.0,
            wholeMilk: true,
            empty: 1.0,
            title: "3",
          ),
          Cup(
            custom: false,
            heat: 80,
            espresso: 0.0,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            milkFoam: 0.0,
            wholeMilk: true,
            empty: 1.0,
            title: "4",
          ),
          Cup(
            custom: false,
            heat: 80,
            espresso: 0.0,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            milkFoam: 0.0,
            wholeMilk: true,
            empty: 1.0,
            title: "5",
          ),
          Cup(
            custom: false,
            heat: 80,
            espresso: 0.0,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            milkFoam: 0.0,
            wholeMilk: true,
            empty: 1.0,
            title: "6",
          ),
          Cup(
            custom: false,
            heat: 80,
            espresso: 0.0,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            milkFoam: 0.0,
            wholeMilk: true,
            empty: 1.0,
            title: "7",
          ),
        ],
        'favoritesCoffeeStack': [
          Cup(
            custom: true,
            heat: 80,
            espresso: 0.2,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.1,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.3,
            wholeMilk: true,
            milkFoam: 0.3,
            empty: 0.1,
            title: "Orange Mocha Frappucino",
            description:
                "Is there anything more to life than being really really really ridiculously good looking? You know what can help you sort through this important issue? ORANGE MOCHA FRAPPUCINO!!!",
          ),
          Cup(
            custom: true,
            heat: 80,
            espresso: 0.2,
            caffeinated: false,
            hotWater: 0.2,
            syrupOne: 0.0,
            syrupTwo: 0.2,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            wholeMilk: true,
            milkFoam: 0.3,
            empty: 0.1,
            title: "Pinkidy Dinkidy",
          ),
          Cup(
            custom: true,
            heat: 80,
            espresso: 0.0,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            milkFoam: 0.0,
            wholeMilk: true,
            empty: 1.0,
            title: "3",
          ),
          Cup(
            custom: true,
            heat: 80,
            espresso: 0.0,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            milkFoam: 0.0,
            wholeMilk: true,
            empty: 1.0,
            title: "4",
          ),
          Cup(
            custom: true,
            heat: 80,
            espresso: 0.0,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            milkFoam: 0.0,
            wholeMilk: true,
            empty: 1.0,
            title: "5",
          ),
          Cup(
            custom: true,
            heat: 80,
            espresso: 0.0,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            milkFoam: 0.0,
            wholeMilk: true,
            empty: 1.0,
            title: "6",
          ),
          Cup(
            custom: true,
            heat: 80,
            espresso: 0.0,
            caffeinated: true,
            hotWater: 0.0,
            syrupOne: 0.0,
            syrupTwo: 0.0,
            syrupThree: 0.0,
            syrupFour: 0.0,
            syrupFive: 0.0,
            syrupSix: 0.0,
            steamedMilk: 0.0,
            milkFoam: 0.0,
            wholeMilk: true,
            empty: 1.0,
            title: "7",
          )
        ],
        'timeStamp': Timestamp.now(),
      });
    // }
  }

  Future<void> addCup(Cup cup) {
    //Remove this function and move it to the home page.
    return data.add({
      //Make this work for recent, standard, and favorites. Replace cup..
      'cup': cup,
      'timeStamp': Timestamp.now(),
    });
  }

  // READ
  Stream<QuerySnapshot> getDataStream() {
    final dataStream = data.orderBy('timeStamp', descending: true).snapshots();
    return dataStream;
  }

  // UPDATE
  Future<void> updateDocument(String docID, Map<String, dynamic> data) {
    return FirebaseFirestore.instance.collection('data').doc(docID).update(data);
  }

  //DELETE
  Future<void> deleteData(String docID) {
    return data.doc(docID).delete();
  }
}