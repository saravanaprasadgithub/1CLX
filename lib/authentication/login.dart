import 'package:flutter/material.dart';
import 'package:one_clx/constants/constant.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController EmailCntrlr = TextEditingController();
  TextEditingController PasswordCntrlr = TextEditingController();
  bool _obscureText = true;
  bool isChecked = false;
  String? email,password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        title: Text('Sign In',style: Const.appbartxt,),
        ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            // Center(
            //   child: Container(
            //     width: 150,
            //     child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fwhitelogo.png?alt=media&token=969e3202-ad65-48b1-9b32-77cb8ccb8704",
            //       fit: BoxFit.contain
            //       ,),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,45,20,10),
              child: TextFormField(
                style: Const.txt,
                keyboardType: TextInputType.emailAddress,
                controller: EmailCntrlr,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                    filled: true,
                    suffixIcon: Icon(Icons.mail_outline_rounded,color: Colors.black,),
                    hintText: 'Email ID',hintStyle: Const.txt,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white,width: 0.2),
                      borderRadius: BorderRadius.circular(20.0),
                    )
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
            Padding(
              padding: const EdgeInsets.fromLTRB(20,10,20,10),
              child: TextFormField(
                style: Const.txt,
                obscureText: _obscureText,
                controller: PasswordCntrlr,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: IconButton(icon: Icon( _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,color: Colors.black,),onPressed: (){
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },),
                    hintText: 'Password',hintStyle: Const.txt,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white,width: 0.2),
                      borderRadius: BorderRadius.circular(20.0),
                    )
                ),
                validator: (String? value){
                  if(value!.isEmpty){
                    return 'Please Enter Password';
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
              padding: const EdgeInsets.fromLTRB(20,12,20,8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
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
          ],
        ),
      ),
      );
  }
}
