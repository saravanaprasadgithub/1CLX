import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_clx/authentication/signup.dart';
import 'package:one_clx/constants/constant.dart';
import 'package:one_clx/registration_forms/business_profile.dart';

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
          content: Text('Do you want to exit?',style: Const.common,),
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
              child:Text('No',style: Const.common,),
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
              child:Text('Yes',style: Const.common,),
            ),
          ],
        ),
      )??false; //if showDialouge had returned null, then return false
    }
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff385CB7), Color(0xff5F89D8),])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text('Sign In',style: Const.appbartxt,),
            ),
          body: ListView(
            children: [
              // Center(
              //   child: Container(
              //     width: 150,
              //     child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fwhitelogo.png?alt=media&token=969e3202-ad65-48b1-9b32-77cb8ccb8704",
              //       fit: BoxFit.contain
              //       ,),
              //   ),
              // ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,10,20,10),
                      child: TextFormField(
                        style: Const.Normal,
                        keyboardType: TextInputType.emailAddress,
                        controller: EmailCntrlr,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(Icons.mail_outline_rounded,color: Const.iconclr),
                            hintText: 'Email ID',hintStyle: Const.txt,
                            errorStyle: Const.errtxt,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white,width: 0.2),
                              borderRadius: BorderRadius.circular(35.0),
                            )
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,10,20,10),
                      child: TextFormField(
                        style: Const.Normal,
                        obscureText: _obscureText,
                        controller: PasswordCntrlr,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: IconButton(icon: Icon( _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,color:Const.iconclr),onPressed: (){
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },),
                            hintText: 'Password',hintStyle: Const.txt,
                            errorStyle: Const.errtxt,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white,width: 0.2),
                              borderRadius: BorderRadius.circular(35.0),
                            )
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
                                unselectedWidgetColor: Colors.white, // Your color
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,8,20,8),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Business_Profile()),
                          );
                          // if(_formkey.currentState!.validate())
                          // {
                          //
                          // }else{
                          //   print("UnSuccessfull");
                          // }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,8,20,8),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20,8,20,8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Login with',style: Const.common,),
                    ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          primary: Colors.white,
                          fixedSize: Size(50,50),
                        ),
                        child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FGicon.png?alt=media&token=77bcfaa4-662d-4503-8a0a-f31adadc9b57")
                    ),
                    ElevatedButton(onPressed: (){},
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
                    ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          primary: Colors.white,
                          fixedSize: Size(50,50),
                        ),
                        child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FTicon.png?alt=media&token=9ea17275-989d-48c4-b982-5a1cb9866135")
                    ),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,8,20,8),
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
              Form(
                key: _formkey2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20,8,20,8),
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    style: Const.Normal,
                    controller: MobileCntrlr,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
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
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white,width: 0.2),
                          borderRadius: BorderRadius.circular(35.0),
                        )
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
              Padding(
                padding: const EdgeInsets.fromLTRB(45,8,45,8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text("Don't have an account?",style: Const.common,),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const signup()),
                      );
                    },style: ElevatedButton.styleFrom(
                      primary: Colors.white, shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    ), child: Text("Sign Up",style: Const.signupbtn,)),
                  ),
                ],),
              ),

            ],
          ),
          ),
      ),
    );
  }
}
