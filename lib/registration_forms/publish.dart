import 'package:flutter/material.dart';
import 'package:one_clx/constants/constant.dart';
import 'package:one_clx/registration_forms/website_created.dart';
import 'package:swipe_to/swipe_to.dart';

class Publish extends StatefulWidget {
  const Publish({Key? key}) : super(key: key);

  @override
  State<Publish> createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffFFFFFF),
      body: Container(
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
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(20,45,20,10),
                child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2Fpub.png?alt=media&token=36a32f5b-6b53-428c-97f9-3210dc5cc22c",width: 70,)
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,10,20,10),
              child: Center(child: Text('Publish',style: Const.appbartxt,)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,10,20,2),
              child: Align(child: Text("5 of 6 Completed",style: Const.OTPtxt,), alignment: Alignment.center,),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,0,20,8),
              child: SizedBox(
                height: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: LinearProgressIndicator(
                    value: 1.0,
                    backgroundColor: Color(0xffF7F8FC),
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4F76CA)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,10,20,10),
              child: Center(child: Text('EASILY IN MINUTES',style: Const.Normalbold,)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,5,20,10),
              child: Center(child: Text("Create a website for your business.",style: Const.Normal,textAlign: TextAlign.justify)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,20,20,8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary:const Color(0xff5F89D8) ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  primary: const Color(0xff5F89D8),
                ),
                child: Text("Publish",style: Const.btntxt,),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Website_Created()),
                  );
                },
              ),
            ),
            Padding(
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
                        MaterialPageRoute(builder: (context) => const Website_Created()),
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
                  //   child: Text("Publish",style: Const.btntxt,),
                  //   onPressed: () async {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => const Website_Created()),
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
    );
  }
}
