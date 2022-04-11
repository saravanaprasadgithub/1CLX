import 'package:flutter/material.dart';
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
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff385CB7), Color(0xff5F89D8),])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text('Sign Up',style: Const.appbartxt,),
        ),
        body: Form(
          key: _formkey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,10),
                child: TextFormField(
                  style: Const.txt,
                  keyboardType: TextInputType.emailAddress,
                  controller: NameCntrlr,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: Icon(Icons.person_outline_outlined,color: Const.iconclr),
                      hintText: 'Name',hintStyle: Const.txt,
                      errorStyle: Const.errtxt,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white,width: 0.2),
                        borderRadius: BorderRadius.circular(35.0),
                      )
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,10),
                child: TextFormField(
                  style: Const.txt,
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
                padding: const EdgeInsets.fromLTRB(20,8,20,8),
                child: TextFormField(
                  style: Const.txt,
                  controller: MobileCntrlr,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: Icon(Icons.phone_android_rounded,color: Const.iconclr),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,10),
                child: TextFormField(
                  style: Const.txt,
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
                    if(_formkey.currentState!.validate())
                    {

                    }else{
                      print("UnSuccessfull");
                    }
                  },
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
                    Text('Sign Up with',style: Const.common,),
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
                padding: const EdgeInsets.fromLTRB(40,20,40,8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Already have an account?",style: Const.common,),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const login()),
                        );
                      },style: ElevatedButton.styleFrom(
                        primary: Colors.white, shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      ), child: Text("Sign In",style: Const.signupbtn,)),
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
