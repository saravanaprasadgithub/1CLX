import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_clx/authentication/login.dart';
import 'package:one_clx/constants/constant.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController EmailCntrlr = TextEditingController();
  TextEditingController PasswordCntrlr = TextEditingController();
  TextEditingController MobileCntrlr = TextEditingController();
  TextEditingController NameCntrlr = TextEditingController();
  bool _obscureText = true;
  String? email,password,mobile,name;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff395DB8),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child:Column(
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
                            child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fsignup.png?alt=media&token=c09e67aa-d7f9-4b6f-8195-8cde196f9a93",
                              width: double.infinity,
                            )),
                      ),

                      SizedBox(height: 5,),
                      Container(
                        color: Color(0xff395DB8),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(20,0,20,0),
                              alignment: Alignment.topLeft,
                              child: Text('Sign Up',style: Const.signuptxt,textAlign: TextAlign.left,),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20,0,20,0),
                              child: TextFormField(
                                style: Const.Normal,
                                keyboardType: TextInputType.emailAddress,
                                controller: NameCntrlr,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                  fillColor: Colors.white,
                                  filled: true,
                                  suffixIcon: Icon(Icons.person_outline_outlined,color: Const.iconclr),
                                  hintText: 'Name',hintStyle: Const.txt,
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
                                    return 'Enter Name';
                                  }
                                  return null;
                                },
                                onSaved: (String? value){
                                  name = value!;
                                },
                              ),
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
                                  suffixIcon: Icon(Icons.phone_android_rounded,color: Const.iconclr),
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
                                child: Text("Create Account",style: Const.btntxt,),
                                onPressed: () async {
                                  if(_formkey.currentState!.validate())
                                  {

                                  }else{
                                    print("UnSuccessfull");
                                  }
                                },
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
                                  Text('Or',style: Const.commonsignup,),
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
                                  Text('Sign Up with',style: Const.commonsignup,),
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
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30,0,30,0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Already have an account?",style: Const.commonsignup,),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  ElevatedButton(onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const login()),
                                    );
                                  },style: ElevatedButton.styleFrom(
                                    primary: Color(0xff395DB8), shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35.0),
                                  ),
                                  ), child: Text("Sign In",style: Const.signupbtn,)),
                                ],),
                            ),
                          ],
                        ),
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
