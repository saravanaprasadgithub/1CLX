import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_clx/authentication/login.dart';
import 'package:one_clx/constants/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_clx/registration_forms/business_profile.dart';

class otp extends StatefulWidget {
 final String phone;
  const otp(this.phone,{Key? key,}) : super(key: key);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  TextEditingController OTPcntrlr = TextEditingController();
  String? otp;
  String? _verificationID;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
@override
  void initState() {
    super.initState();
    verifyphone();
  }
  verifyphone()async{
  await _auth.verifyPhoneNumber(
    timeout: Duration(seconds: 120),
      phoneNumber: widget.phone,
      verificationCompleted: (PhoneAuthCredential authCredential)async{
     await _auth.signInWithCredential(authCredential).then((value)  async{
       Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => const Business_Profile()),
       );
     });
      },
      verificationFailed: (FirebaseAuthException e){
        Fluttertoast.showToast(
            timeInSecForIosWeb: 1,
            msg: "Enter Mobile.No With Country Code",
           // msg: e.message!,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.deepOrange,
            textColor: Colors.white
        );
      print(e.message);
      },
      codeSent: (verificationId,resendingToken){
      setState(() {
       _verificationID=verificationId;
      });
      },
      codeAutoRetrievalTimeout: (verificationId){
      setState(() {
      _verificationID=verificationId;
      });
      }
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff395DB8),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Expanded(
                        child:Container(
                            decoration: new BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: new BorderRadius.only(
                                  bottomRight: const Radius.circular(40.0),
                                  bottomLeft: const Radius.circular(40.0),
                                )
                            ),
                            child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Freset.png?alt=media&token=596466ee-7f7f-4a56-9bff-1a9845cf6ff6",width: double.infinity,)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                        child: Text("OTP",style: Const.signuptxt,textAlign: TextAlign.left,),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                        child: TextFormField(
                          style: Const.Normal,
                          keyboardType: TextInputType.number,
                          controller: OTPcntrlr,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              errorStyle: Const.errtxt,
                              contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                              suffixIcon: Icon(Icons.lock_outline_rounded,color: Const.iconclr),
                              hintText: 'Enter Your OTP',hintStyle: Const.txt,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35.0),
                              borderSide: const BorderSide(color: Color(0xff5F89D8),width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35.0),
                              borderSide:  BorderSide(color: Colors.grey.shade300,width: 1),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35.0),
                              borderSide: const BorderSide(color: Colors.red,width: 1),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35.0),
                              borderSide: const BorderSide(color: Colors.red,width: 1),
                            ),
                          ),
                          validator: (String? value){
                            if(value!.isEmpty){
                              return 'Please Enter OTP';
                            }
                            if(value.length<=5||value.length>6){
                              return 'OTP Must be 6 Characters';
                            }
                            return null;
                          },
                          onSaved: (String? value ){
                            otp = value!;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: const Color(0xff5F89D8),
                          ),
                          child: Text("Submit",style: Const.btntxt,),
                          onPressed: ()async {
                            if(_formkey.currentState!.validate())
                            {
                              try {
                                await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: _verificationID!, smsCode: OTPcntrlr.text)).then((value) {
                                  if(value.user!=null){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const Business_Profile()),
                                    );
                                  }
                                });
                              } on Exception catch (e) {
                                Fluttertoast.showToast(
                                    timeInSecForIosWeb: 1,
                                    msg: "Invalid OTP",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.deepOrange,
                                    textColor: Colors.white
                                );
                              }
                              return;
                            }else{
                              print("UnSuccessfull");
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30,0,30,0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("I want to return to?",style: Const.commonsignup,),
                            SizedBox(
                              width: 5.0,
                            ),
                            ElevatedButton(onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const login()),
                              );
                            },style: ElevatedButton.styleFrom(
                              primary: Color(0xffFFFFFF), shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            ), child: Text("Sign In",style: Const.signinbtn,)),
                          ],),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
