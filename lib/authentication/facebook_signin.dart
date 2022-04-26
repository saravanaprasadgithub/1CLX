import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class facebook{
  facebooklogin()async {
    try {
      final facebook_login = await FacebookAuth.instance.login();
     // final userdata = await FacebookAuth.instance.getUserData();
      final facebookcredential=FacebookAuthProvider.credential(facebook_login.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookcredential);
      // await FirebaseFirestore.instance.collection("Users").doc().set({
      //   'email':userdata['email'],
      //   'imageurl':userdata['picture']['data']['url'],
      //   'name':userdata['name'],
      // });
    }on FirebaseAuthException catch(e){
      print('faceb$e');
      Fluttertoast.showToast(
          timeInSecForIosWeb: 1,
          msg: "Facebook Login Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.deepOrange,
          textColor: Colors.white
      );
    }
  }
  facebooklogout() async{
    await FirebaseAuth.instance.signOut();
}
}