import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {

  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn(); 

  signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // Obtain the auth details from the request
      if(googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Once signed in, return the UserCredential
        return await _auth.signInWithCredential(credential);
      }
    } on FirebaseAuthException catch(e) {
      print(e.message);
      throw e;
    }
  }

  signOutWithGoogle() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }


}