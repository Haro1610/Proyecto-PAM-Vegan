import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserAuthRepository {
  final GoogleSignIn _googleSingIn = GoogleSignIn(scopes: ["email"]);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String photoUrl = "";

  bool isAlreadyAuthenticated() {
    return _auth.currentUser != null;
  }

  Future<void> singOutGoogleUsers() async {
    await _googleSingIn.signOut();
  }

  Future<void> singOutFirebaseUsers() async {
    await _auth.signOut();
  }

  Future<void> singInGoogle() async {
    final googleUser = await _googleSingIn.signIn();
    final googleAuth = await googleUser!.authentication;

    print("user:${googleUser.email}");
    print("user:${googleUser.displayName}");
    print("user:${googleUser.photoUrl}");

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final authResult = await _auth.signInWithCredential(credential);

    User user = authResult.user!;
    final firebaseToken = await user.getIdToken();
    print("user fcm token:${firebaseToken}");

    await _createUserCollectionFirebase(
        _auth.currentUser!.uid, googleUser.displayName);

    //crear un documento en la tabla en users y agregar el valor de fotolistId
    //await _CreateUserCollectionFirebase(_auth.currentUser!.uid);
  }

  Future<void> _createUserCollectionFirebase(
      String uid, String? username) async {
    var userDoc =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    // Si no existe el doc, lo crea con valor default
    if (!userDoc.exists) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set({"username": username, "recetas": []});
    } else {
      // Si ya existe el doc, pues chido, return
      return;
    }
  }
}
