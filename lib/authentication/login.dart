import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_clx/authentication/email_verification.dart';
import 'package:one_clx/authentication/facebook_signin.dart';
import 'package:one_clx/authentication/google_signin.dart';
import 'package:one_clx/authentication/signup.dart';
import 'package:one_clx/authentication/twitter%20_signin.dart';
import 'package:one_clx/constants/constant.dart';
import 'package:one_clx/registration_forms/business_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController EmailCntrlr = TextEditingController();
  TextEditingController PasswordCntrlr = TextEditingController();
  TextEditingController MobileCntrlr = TextEditingController();
  bool _obscureText = true;
  bool isChecked = false;
  String? email,password,mobile;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
  final userid = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  SharedPreferences? logindata;
  bool? newuser;
  @override
  void initState() {
    check_if_already_login();
    super.initState();
  }
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata!.getBool('login') ?? true);
    print(newuser);
    if (newuser == false &&
        FirebaseAuth.instance.currentUser!.emailVerified == true) {
      Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => Business_Profile()));
    } //checking both email verification and new user
  }
  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog( //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Color(0xff385CB7),
          title: Text('Exit App',style: Const.btntxt,),
          content: Text('Do you want to exit?',style: Const.whitetext,),
          actions:[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                primary: const Color(0xff5F89D8),
              ),
              onPressed: () => Navigator.of(context).pop(false),
              //return false when click on "NO"
              child:Text('No',style: Const.whitetext,),
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                primary: const Color(0xff5F89D8),
              ),
              onPressed: () =>  SystemNavigator.pop(),
              //return true when click on "Yes"
              child:Text('Yes',style: Const.whitetext,),
            ),
          ],
        ),
      )??false; //if showDialouge had returned null, then return false
    }
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        backgroundColor: Color(0xff395DB8),
        body: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Expanded(
                        child:Column(
                          children: [
                            Expanded(
                              child: Image.network(
                                "https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fsignin.png?alt=media&token=ee8d84e8-fb08-4b1e-960a-aa1c8dbdd4ba",),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              decoration: new BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(40.0),
                                    topRight: const Radius.circular(40.0),
                                  )
                              ),
                              child: Column(
                                children: [
                                  Form(
                                    key: _formkey,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 5,),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(20,0,20,0),
                                          alignment: Alignment.topLeft,
                                          child: Text('Sign In',style: Const.appbartxt,textAlign: TextAlign.left,),
                                        ),
                                        SizedBox(height: 5,),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(20,0,20,0),
                                          child: TextFormField(
                                            style: Const.Normal,
                                            keyboardType: TextInputType.emailAddress,
                                            controller: EmailCntrlr,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                              fillColor: Colors.white,
                                              filled: true,
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
                                                return 'Enter Email-ID';
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
                                        SizedBox(height: 5,),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(20,0,20,0),
                                          child: TextFormField(
                                            style: Const.Normal,
                                            obscureText: _obscureText,
                                            controller: PasswordCntrlr,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                              fillColor: Colors.white,
                                              filled: true,
                                              suffixIcon: IconButton(icon: Icon( _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,color:Const.iconclr),onPressed: (){
                                                setState(() {
                                                  _obscureText = !_obscureText;
                                                });
                                              },),
                                              hintText: 'Password',hintStyle: Const.txt,
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
                                                return 'Enter Password';
                                              }
                                              if(value.length<=7){
                                                return 'Password Must be 8 Characters';
                                              }
                                              return null;
                                            },
                                            onSaved: (String? value){
                                              password = value!;
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              children: [
                                                Theme(
                                                  child: Checkbox(
                                                    value: isChecked, onChanged: (value){
                                                    isChecked=!isChecked;
                                                    setState(() {

                                                    });
                                                  },
                                                  ),
                                                  data: ThemeData(
                                                    // primarySwatch: Colors.blue,
                                                    unselectedWidgetColor: Color(0xff395DB8), // Your color
                                                  ),
                                                ),
                                                Text('Remember',style: Const.common,),
                                              ],
                                            ),
                                            TextButton(
                                              child: Text('Forgot Password?',style:Const.common,),
                                              onPressed: (){
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(builder: (context) => const forgot_password()),
                                                // );
                                              },
                                            ),
                                          ],),
                                        SizedBox(height: 5,),
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
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(builder: (context) => const Business_Profile()),
                                              // );
                                              if(_formkey.currentState!.validate())
                                              {
                                                try {
                                                  final user= await _firebaseAuth.signInWithEmailAndPassword(email: EmailCntrlr.text.trim(), password: PasswordCntrlr.text.trim());
                                                  if (user != null && FirebaseAuth.instance.currentUser!.emailVerified==true ){
                                                    Fluttertoast.showToast(
                                                        timeInSecForIosWeb: 1,
                                                        msg: "Login Successfully..!!!",
                                                        toastLength: Toast.LENGTH_SHORT,
                                                        gravity: ToastGravity.BOTTOM,
                                                        backgroundColor: Color(0xff5F89D8),
                                                        textColor: Colors.white
                                                    );
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => const Business_Profile()),
                                                    );
                                                  }
                                                  else {
                                                    Fluttertoast.showToast(
                                                        timeInSecForIosWeb: 1,
                                                        msg: "Email Not Verified",
                                                        toastLength: Toast.LENGTH_SHORT,
                                                        gravity: ToastGravity.BOTTOM,
                                                        backgroundColor: Colors.deepOrange,
                                                        textColor: Colors.white
                                                    );
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => const verify_email()),
                                                    );
                                                  }
                                                }catch(e)
                                                {
                                                  Fluttertoast.showToast(
                                                      timeInSecForIosWeb: 1,
                                                      msg: "Invalid Email-ID or Password",
                                                      toastLength: Toast.LENGTH_SHORT,
                                                      gravity: ToastGravity.BOTTOM,
                                                      backgroundColor: Colors.deepOrange,
                                                      textColor: Colors.white
                                                  );
                                                }
                                                logindata!.setBool('login', false);
                                                logindata!.setString('email', email!);
                                                logindata!.setString('password', password!);
                                                return;
                                              }else{
                                                print("UnSuccessfull");
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(20,0,20,0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            thickness: 2.5,
                                            color: Color(0xff5F89D8),
                                          ),
                                        ),
                                        Text('Or',style: Const.common,),
                                        Expanded(
                                          child: Divider(
                                            thickness: 2.5,
                                            color: Color(0xff5F89D8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(20,0,20,0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Login with',style: Const.common,),
                                        ElevatedButton(onPressed: () async{
                                          await FirebaseServices().signInWithGoogle();
                                          logindata!.setBool('login', false);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => const Business_Profile()),
                                              );
                                        },
                                            style: ElevatedButton.styleFrom(
                                              shape: CircleBorder(),
                                              primary: Colors.white,
                                              fixedSize: Size(50,50),
                                            ),
                                            child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FGicon.png?alt=media&token=77bcfaa4-662d-4503-8a0a-f31adadc9b57")
                                        ),
                                        ElevatedButton(onPressed: () async{
                                          await facebook().facebooklogin();
                                          logindata!.setBool('login', false);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const Business_Profile()),
                                          );
                                        },
                                            style: ElevatedButton.styleFrom(
                                              shape: CircleBorder(),
                                              primary: Colors.white,
                                              fixedSize: Size(50,50),
                                            ),
                                            child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FFicon.png?alt=media&token=01d5ecea-1d57-4058-b958-db340ebb877f")
                                        ),
                                        ElevatedButton(onPressed: (){},
                                            style: ElevatedButton.styleFrom(
                                              shape: CircleBorder(),
                                              primary: Colors.white,
                                              fixedSize: Size(50,50),
                                            ),
                                            child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FLicon.png?alt=media&token=456aa250-b8d1-4fb0-8fa1-cddc636a7e1d")
                                        ),
                                        ElevatedButton(onPressed: () async{
                                          await twitter().twitterlogin();
                                          logindata!.setBool('login', false);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const Business_Profile()),
                                          );
                                        },
                                            style: ElevatedButton.styleFrom(
                                              shape: CircleBorder(),
                                              primary: Colors.white,
                                              fixedSize: Size(50,50),
                                            ),
                                            child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FTicon.png?alt=media&token=9ea17275-989d-48c4-b982-5a1cb9866135")
                                        ),
                                      ],),
                                  ),
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(20,0,20,0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            thickness: 2.5,
                                            color: Color(0xff5F89D8),
                                          ),
                                        ),
                                        Text('Or',style: Const.common,),
                                        Expanded(
                                          child: Divider(
                                            thickness: 2.5,
                                            color: Color(0xff5F89D8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Form(
                                    key: _formkey2,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(20,0,20,0),
                                      child: TextFormField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        style: Const.Normal,
                                        controller: MobileCntrlr,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                          fillColor: Colors.white,
                                          filled: true,
                                          suffixIcon: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(35.0),
                                              ),
                                              primary: const Color(0xffDCE8EF),
                                            ),
                                            onPressed: ()async {
                                              if(_formkey2.currentState!.validate())
                                              {

                                              }else{
                                                print("UnSuccessfull");
                                              }
                                            },
                                            child: Text('Request OTP',style:Const.OTPtxt,),
                                          ),
                                          hintText: "Mobile Number",hintStyle: Const.txt,
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
                                            return 'Enter Mobile No';
                                          }
                                          if(value.length<=9||value.length>10){
                                            return 'Mobile.No has 10 digits';
                                          }
                                          return null;
                                        },
                                        onSaved: (String? value){
                                          mobile = value!;
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(30,0,30,0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("Don't have an account?",style: Const.common,),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        ElevatedButton(onPressed: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const signup()),
                                          );
                                        },style: ElevatedButton.styleFrom(
                                          primary: Color(0xff395DB8), shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(35.0),
                                        ),
                                        ), child: Text("Sign Up",style: Const.signupbtn,)),
                                      ],),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),)
                    ],
                  ),
                ),
              ),
        ),
    );
  }
}
