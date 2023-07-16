import '../controller/firebase_consts.dart';

class RideServices {
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  static getRide() {
    return firestore.collection(vehicleCollection).snapshots();
  }
}
