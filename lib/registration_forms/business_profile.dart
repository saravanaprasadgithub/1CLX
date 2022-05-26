import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_clx/authentication/login.dart';
import 'package:one_clx/constants/commonValues.dart';
import 'package:one_clx/constants/constant.dart';
import 'package:one_clx/registration_forms/business_location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipe_to/swipe_to.dart';

class Business_Profile extends StatefulWidget {
  const Business_Profile({Key? key}) : super(key: key);

  @override
  State<Business_Profile> createState() => _Business_ProfileState();
}

class _Business_ProfileState extends State<Business_Profile> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController BusinessName = TextEditingController();
  final userid = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;
  String? businame,businesstype;
  SharedPreferences? logindata;
  String? email;

  @override
  void initState() {
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      email = logindata!.getString('email');
    });
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
          title: Text('Logout',style: Const.btntxt,),
          content: Text('Do you want to Logout?',style: Const.whitetext,),
          actions:[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                primary: const Color(0xff5F89D8),
              ),
              onPressed: () async{
                 Navigator.of(context).pop(false);
              },
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
              onPressed: () {
                //await FirebaseServices().googleSignOut();
                //await twitter().twitterlogout();
                //await facebook().facebooklogout();
                logindata!.setBool('login', true);//maintain login data
                Navigator.push(context, MaterialPageRoute(builder: (context) => const login()),);
                   },
              //return true when click on "Yes"
              child:Text('Yes',style: Const.whitetext,),
            ),
          ],
        ),
      )??false; //if showDialouge had returned null, then return false
    }
    return WillPopScope(
      onWillPop:showExitPopup ,
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: Container(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
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
                      SizedBox(
                          height: 40
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(20,0,20,0),
                          child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FBP.png?alt=media&token=691c22f3-68af-4df3-a66c-97d23e551355",width: 70,)
                      ),
                      SizedBox(
                          height: 10
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                        child: Center(child: Text('Business Profile',style: Const.appbartxt,)),
                      ),
                      SizedBox(
                          height: 30
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                        child: Align(child: Text("0 of 6 Completed",style: Const.OTPtxt,), alignment: Alignment.center,),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                        child: SizedBox(
                          height: 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: LinearProgressIndicator(
                              value: 0.1,
                              backgroundColor: Color(0xffF7F8FC),
                              valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4F76CA)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 20
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                        child: Center(child: Text('CREATE BUSINESS PROFILE',style: Const.Normalbold,)),
                      ),
                      SizedBox(
                          height: 10
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                        child: Center(child: Text('Start Buliding Your Business Profile',style: Const.Normal)),
                      ),
                      SizedBox(
                          height: 20
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                        child: TextFormField(
                          style: Const.Normal,
                          keyboardType: TextInputType.emailAddress,
                          controller: BusinessName,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(Icons.business,color: Const.iconclr),
                            hintText: 'Business Name',hintStyle: Const.txt,
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
                              return 'Enter Your Business Name';
                            }
                            return null;
                          },
                          onSaved: (String? value){
                            businame = value!;
                          },
                        ),
                      ),
                      SizedBox(
                          height: 10
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                        child: DropdownButtonFormField<String>(
                          items: [
                            DropdownMenuItem<String>(
                              value: "Healthcare",
                              child: Text("Healthcare",style: Const.Normal,),
                            ),
                            DropdownMenuItem<String>(
                              value: "Manufacturing",
                              child: Text("Manufacturing",style: Const.Normal,),
                            ),
                            DropdownMenuItem<String>(
                              value: "Education",
                              child: Text("Education",style: Const.Normal,),
                            ),
                            DropdownMenuItem<String>(
                              value: "Startup",
                              child: Text("Startup",style: Const.Normal,),
                            ),
                            DropdownMenuItem<String>(
                              value: "E-Commerce",
                              child: Text("E-Commerce",style: Const.Normal,),
                            ),
                            DropdownMenuItem<String>(
                              value: "Small Business",
                              child: Text("Small Business",style: Const.Normal,),
                            ),
                            DropdownMenuItem<String>(
                              value: "Others",
                              child: Text("Others",style: Const.Normal,),
                            ),
                          ],
                          onChanged: (value)async{
                            setState(() {
                              businesstype=value;
                            }
                            );
                          },
                          value: businesstype,
                          validator: (value)=>value==null?"Select Your Business Category":null,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Choose',hintStyle: Const.txt,
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
                      // SizedBox(
                      //     height: 70
                      // ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
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
                                   MaterialPageRoute(builder: (context) => const Business_Location()),
                                 );
                                //  if(_formkey.currentState!.validate())
                                //  {
                                //  logindata!.setString('businessName',BusinessName.text);
                                //  try {
                                //    firestoreInstance.collection("Business Details").doc(userid!.email).set(
                                //    {
                                //     'Business Name':BusinessName.text,'Business Type':businesstype.toString()
                                //    }
                                //    ).then((value) => {
                                //    Navigator.push(context, MaterialPageRoute(builder: (context) => const Business_Location()),),
                                //    });
                                //    Fluttertoast.showToast(
                                //    timeInSecForIosWeb: 1,
                                //    msg: "Your Details Submitted Successfully..!!!",
                                //    toastLength: Toast.LENGTH_SHORT,
                                //    gravity: ToastGravity.BOTTOM,
                                //    backgroundColor: Colors.deepPurple,
                                //    textColor: Colors.white
                                //    );
                                //  } catch (e) {
                                //    Fluttertoast.showToast(
                                //        timeInSecForIosWeb: 1,
                                //        msg: "Values Not Stored",
                                //        toastLength: Toast.LENGTH_SHORT,
                                //        gravity: ToastGravity.BOTTOM,
                                //        backgroundColor: Colors.deepOrange,
                                //        textColor: Colors.white
                                //    );
                                //  }
                                // return;
                                //  }else{
                                //    print("UnSuccessfull");
                                //  }
                               },
                               onRightSwipe: ()async{
                                 showExitPopup();
                               },
                             ),
                              Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2FRight.png?alt=media&token=6f429db7-33c2-4063-865b-f0f8417a4acc",),
                              Padding(
                                padding: const EdgeInsets.only(top:30.0),
                                child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fimg2.png?alt=media&token=b8fcb386-3ab4-4f9c-bece-bc3be039c5e5",width: 70,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
