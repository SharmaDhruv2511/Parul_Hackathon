import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pu_hack/controller/firebase_consts.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController {
  //login method
  var emailController = TextEditingController();
  var passController = TextEditingController();
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //signup method

  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  storeUserData(name, password, email) async {
    DocumentReference store =
        firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'id': currentUser!.uid
    });
  }

  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  storeVehicleData(
      {name,
      vehicleNo,
      email,
      mobileNo,
      context,
      pickupPoint,
      dropPoint}) async {
    await firestore.collection(vehicleCollection).doc().set({
      'owner_name': name,
      'vehicle_number': vehicleNo,
      'email': email,
      'mobile_number': mobileNo,
      'source': pickupPoint,
      'destination': dropPoint,
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    }).then((value) => VxToast.show(context, msg: "Details Upload"));
  }
}
