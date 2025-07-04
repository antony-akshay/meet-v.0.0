import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meet/utils/showSnackbar.dart';

class AuthMethods {

 final FirebaseAuth _auth = FirebaseAuth.instance;
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 Stream<User?> get authChanges => _auth.authStateChanges();

 Future<bool> signInWithGoogle(BuildContext context) async{
  bool res = false;
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
    );


    UserCredential userCredential = await _auth.signInWithCredential(credential);

    User? user = userCredential.user;

    if(user!=null){
      if(userCredential.additionalUserInfo!.isNewUser) {
        _firestore.collection('users').doc(user.uid).set({
          'username' : user.displayName,
          'uid': user.uid,
          'profilePhoto' : user.photoURL
        });
      }
    }

    res=true;
  } on FirebaseAuthException catch (e) {
    showSnackBar(context, e.message!);
    res =false;
  }
  return res;
 }
}
