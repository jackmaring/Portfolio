import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:spotjob/pages/tabs_page.dart';

class AuthService {
  // Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  Future<String> signIn(String email, String password) async {
    AuthResult result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {
    AuthResult result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  // Log in user
  // void login(BuildContext context, String email, String password) async {
  //   FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: email, password: password)
  //       .then((user) {
  //     if (user != null) {
  //       Navigator.of(context).pushNamed(TabsPage.routeName);
  //     } else {
  //       print('oops');
  //     }
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

  // // Create new user
  // void createUser(BuildContext context, String email, String password) {
  //   FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email, password: password)
  //       .then((user) {
  //     if (user != null) {
  //       Navigator.of(context).pushNamed(TabsPage.routeName);
  //     } else {
  //       print('oops');
  //     }
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }
}
