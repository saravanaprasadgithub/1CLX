import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_clx/authentication/login.dart';
import 'package:one_clx/constants/constant.dart';

class forgot_password extends StatefulWidget {
  const forgot_password({Key? key}) : super(key: key);

  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController EmailCntrlr = TextEditingController();
  String? email;
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
                        child: Text("Password Reset",style: Const.signuptxt,textAlign: TextAlign.left,),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                        child: TextFormField(
                          style: Const.Normal,
                          keyboardType: TextInputType.emailAddress,
                          controller: EmailCntrlr,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                            suffixIcon: Icon(Icons.mail_outline_rounded,color: Const.iconclr),
                              hintText: 'Email ID',hintStyle: Const.txt,
                              errorStyle: Const.errtxt,
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
                              return 'Please Enter Email-ID';
                            }
                            if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                              return 'Please a valid Email';
                            }
                            return null;
                          },
                          onSaved: (String? value){
                            email = value!;
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
                          onPressed: () async {
                            if(_formkey.currentState!.validate())
                            {
                              try{
                                await FirebaseAuth.instance.sendPasswordResetEmail(email: EmailCntrlr.text.trim());
                                Fluttertoast.showToast(
                                    timeInSecForIosWeb: 1,
                                    msg: "Reset Password Link Sent to Your Email-ID",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.deepOrange,
                                    textColor: Colors.white

                                );
                                Navigator.of(context).pop();
                              }on FirebaseAuthException catch(e){
                                Fluttertoast.showToast(
                                    timeInSecForIosWeb: 1,
                                    msg: "Check Your Email or No Internet",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.deepOrange,
                                    textColor: Colors.white
                                );
                              }
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
