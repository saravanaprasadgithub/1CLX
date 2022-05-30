import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:one_clx/constants/constant.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Website_Created extends StatefulWidget {
  const Website_Created({Key? key}) : super(key: key);

  @override
  State<Website_Created> createState() => _Website_CreatedState();
}

class _Website_CreatedState extends State<Website_Created> {
  final firestoreInstance = FirebaseFirestore.instance;
  final userid = FirebaseAuth.instance.currentUser;
  String?businessName;
  @override
  void initState() {
    getdata();
    super.initState();
  }
  getdata()async{
 final data = firestoreInstance.collection("Business Details").doc(userid!.email);
    final snapshot = await data.get();
    if(snapshot.exists){
      setState(() {
        businessName=snapshot['Business Name'];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffFFFFFF),
      body: Container(
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
                      0.2,
                    ],
                    colors: [
                      Color(0xff385CB7),
                      Color(0xff5F89D8),
                      Color(0xffFFFFFF),
                    ]
                )
            ),
            child: Column(
              children: [
                SizedBox(height: 130,),
                Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,20,0),
                    child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fcomplete.png?alt=media&token=6d442c4f-7d07-43a3-8c3d-b38c13caa464",height: 200,)
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Center(child: Text('CONGRATS!!! YOU COMPLETED THE PROCESS',style: Const.Normalbold,textAlign: TextAlign.center,)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Center(child: Text("Your Business Website URL:",style: Const.Normal,textAlign: TextAlign.center,)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: GestureDetector(
                    child: Text(
                      "https://www.1clx.com/${businessName}",style: Const.UrlLink,textAlign: TextAlign.center
                    ),
                    onTap: ()async{
                      try {
                      await launchUrlString("https://version.0.0.1clx.com/");
                      }catch(e){
                        print("Link Incorrect");
                      }
                    },
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary:const Color(0xff5F89D8) ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      primary: const Color(0xff5F89D8),
                    ),
                    child: Text("Dashboard",style: Const.btntxt,),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary:const Color(0xff5F89D8) ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      primary: const Color(0xff5F89D8),
                    ),
                    child: Text("Website",style: Const.btntxt,),
                    onPressed: () async {
                          try {
                          await launchUrlString("https://version.0.0.1clx.com/");
                          }catch(e){
                            print("Link Incorrect");
                          }
                    },
                  ),
                ),
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => const Business_Location()),
                            // );
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
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
    );
  }
}
