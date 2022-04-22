import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_clx/authentication/login.dart';
import 'package:one_clx/constants/constant.dart';
import 'package:one_clx/registration_forms/business_profile.dart';

class verify_email extends StatefulWidget {
  const verify_email({Key? key}) : super(key: key);

  @override
  State<verify_email> createState() => _verify_emailState();
}

class _verify_emailState extends State<verify_email> {
  TextEditingController Activationcode = TextEditingController();
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  void initState(){
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if(!isEmailVerified){
      sendVerificationEmail();
      timer=Timer.periodic(
        Duration(seconds: 3),
            (_) => checkEmailVerified(),
      );
    }
  }
  void dispose(){
    timer?.cancel();
    super.dispose();
  }
  Future checkEmailVerified() async{
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if(isEmailVerified) timer?.cancel();
  }
  Future sendVerificationEmail() async{
    try{
      final user =FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    }
    catch(e){
      Fluttertoast.showToast(
          timeInSecForIosWeb: 1,
          msg: "Email Verification Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.deepPurple,
          textColor: Colors.white
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return isEmailVerified ? Business_Profile():Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.0,
                  0.1,
                  0.3,
                ],
                colors: [
                  Color(0xff385CB7),
                  Color(0xff5F89D8),
                  Color(0xffFFFFFF),
                ]
            )
        ),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fbluelogo.png?alt=media&token=c919e773-a4b6-460e-a16f-082a8a93a35d",width: 120,)
              ),
              SizedBox(
                  height: 15
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: Center(child: Text('Email Verification',style: Const.appbartxt,)),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text('Activation Link Sent to Your Email-ID',style: TextStyle(
                    fontSize: 22,fontWeight: FontWeight.w600,
                    color: Colors.deepPurple
                ),),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70,10,70,10),
                child: ElevatedButton.icon(
                  icon:Icon(Icons.email,color: Const.iconclr,),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff395DB8),
                  ),
                  label: Text("Resend Verification",style: Const.btntxt,),
                  onPressed: canResendEmail?sendVerificationEmail:null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70,10,70,10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange
                    ),
                    child: Text("Cancel",style: Const.btntxt,),
                    onPressed:()
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const login()),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
