import 'package:flutter/material.dart';
import 'package:one_clx/constants/constant.dart';
import 'package:one_clx/registration_forms/business_logo.dart';
import 'package:swipe_to/swipe_to.dart';

class Business_Description extends StatefulWidget {
  const Business_Description({Key? key}) : super(key: key);

  @override
  State<Business_Description> createState() => _Business_DescriptionState();
}

class _Business_DescriptionState extends State<Business_Description> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController BusinessDesc = TextEditingController();
  TextEditingController EmailCntrlr = TextEditingController();
  TextEditingController WebURLCntrlr = TextEditingController();
  String ? busdesc,email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Container(
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
                Padding(
                    padding: const EdgeInsets.fromLTRB(20,40,20,0),
                    child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FBD.png?alt=media&token=88d7acab-112e-47e1-b6b6-9b7c0f94b91a",width: 70,)
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,8,20,10),
                  child: Center(child: Text('Business Description',style: Const.appbartxt,)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,35,20,2),
                  child: Align(child: Text("3 of 6 Completed",style: Const.OTPtxt,), alignment: Alignment.center,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,8),
                  child: SizedBox(
                    height: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: LinearProgressIndicator(
                        value: 0.6,
                        backgroundColor: Color(0xffF7F8FC),
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4F76CA)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,10,20,10),
                  child: Center(child: Text('ADD BUSINESS DESCRIPTION',style: Const.Normalbold,)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,5,20,10),
                  child: Center(child: Text("Provide an overview of the business.This description provides extensive details outlining the business.",style: Const.Normal,textAlign: TextAlign.justify)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,10,20,0),
                  child: TextFormField(
                    maxLength: null,
                    style: Const.Normal,
                    keyboardType: TextInputType.emailAddress,
                    controller: BusinessDesc,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: Icon(Icons.book_outlined,color: Const.iconclr),
                      hintText: 'Enter your business overview for about page description.',hintStyle: Const.txt,
                      hintMaxLines: 2,
                      errorStyle: Const.errtxt,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xff5F89D8),width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xff5F89D8),width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.red,width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.red,width: 1),
                      ),
                    ),
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Enter Business Description';
                      }
                      return null;
                    },
                    onSaved: (String? value){
                      busdesc = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,10,20,0),
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
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xff5F89D8),width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xff5F89D8),width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.red,width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,10,20,0),
                  child: TextFormField(
                    style: Const.Normal,
                    keyboardType: TextInputType.emailAddress,
                    controller: WebURLCntrlr,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: Icon(Icons.link,color: Const.iconclr),
                      hintText: 'Existing Website URL (Optional)',hintStyle: Const.txt,
                      errorStyle: Const.errtxt,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xff5F89D8),width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xff5F89D8),width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.red,width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.red,width: 1),
                      ),
                    ),
                  ),
                ),
                Padding (
                  padding: const EdgeInsets.all(8.0),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fimg1.png?alt=media&token=8aa401b4-5635-451f-af67-3dcd82117797",width: 70,),
                      Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2FLefi.png?alt=media&token=6ce0a918-d370-46ac-8569-13be12e85940",),
                      SwipeTo(
                        child: Text("Swipe",style: Const.common,),
                        iconColor: Colors.transparent,
                        onLeftSwipe: () async{
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Business_Logo()),
                          );
                          // if(_formkey.currentState!.validate())
                          // {
                          //
                          // }else{
                          //   print("UnSuccessfull");
                          // }

                        },
                        onRightSwipe: ()async{
                          Navigator.pop(context);
                        },

                      ),
                      Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2FRight.png?alt=media&token=6f429db7-33c2-4063-865b-f0f8417a4acc",),

                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     onPrimary:const Color(0xff5F89D8) ,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(5.0),
                      //     ),
                      //     primary: const Color(0xff5F89D8),
                      //   ),
                      //   child: Text("Previous",style: Const.btntxt,),
                      //   onPressed: () async {
                      //     Navigator.pop(context);
                      //   },
                      // ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     onPrimary:const Color(0xff5F89D8) ,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(5.0),
                      //     ),
                      //     primary: const Color(0xff5F89D8),
                      //   ),
                      //   child: Text("Next",style: Const.btntxt,),
                      //   onPressed: () async {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => const Business_Logo()),
                      //     );
                      //     // if(_formkey.currentState!.validate())
                      //     // {
                      //     //
                      //     // }else{
                      //     //   print("UnSuccessfull");
                      //     // }
                      //   },
                      // ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                        child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fimg2.png?alt=media&token=b8fcb386-3ab4-4f9c-bece-bc3be039c5e5",width: 70,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
