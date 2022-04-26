import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:twitter_login/twitter_login.dart';

class twitter{
  twitterlogin()async{
    try{
      final twitterlogin = TwitterLogin(apiKey: "kPB5yEtU1bRYultcsnkrlLCYx", apiSecretKey: "UihteQF4epMGurv5viSwVCQ04tp5ELmqv05iqd1Xzi6UoGWzIZ", redirectURI: 'twitter-firebase-auth://');
      await twitterlogin.login().then((value) async{
        final twitterAuthCredentials= TwitterAuthProvider.credential(accessToken: value.authToken!, secret: value.authTokenSecret!);
        await FirebaseAuth.instance.signInWithCredential(twitterAuthCredentials);
      }
      );
    }on FirebaseAuthException catch(e){
      print('twitter$e');
      Fluttertoast.showToast(
          timeInSecForIosWeb: 1,
          msg: "Twitter Login Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.deepOrange,
          textColor: Colors.white
      );
    }

  }
  twitterlogout()async{
    await FirebaseAuth.instance.signOut();
  }
}