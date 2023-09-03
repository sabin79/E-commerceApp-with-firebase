import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum ApplicationLoginState { loggetIn, LoggetOut }

class ApplicationState extends ChangeNotifier {
  User? user;
  ApplicationLoginState loginState = ApplicationLoginState.LoggetOut;

  ApplicationState() {
    init();
  }

  Future<void> init() async {
    FirebaseAuth.instance.userChanges().listen((userfir) {
      if (userfir != null) {
        loginState = ApplicationLoginState.loggetIn;
        user = userfir;
      }
      notifyListeners();
    });
  }

  Future<void> signIn(String email, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  Future<void> signUp(String email, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      //stripe user create
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
