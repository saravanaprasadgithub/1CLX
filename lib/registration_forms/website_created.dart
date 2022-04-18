import 'package:flutter/material.dart';
import 'package:one_clx/constants/constant.dart';

class Website_Created extends StatefulWidget {
  const Website_Created({Key? key}) : super(key: key);

  @override
  State<Website_Created> createState() => _Website_CreatedState();
}

class _Website_CreatedState extends State<Website_Created> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffFFFFFF),
      body: Column(
        children: [
          Expanded(
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
                    child: Center(child: Text("https://www.1clx.com/businessname",style: Const.Normal,textAlign: TextAlign.center,)),
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const Business_Description()),
                        // );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8,0,8,0),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fimg1.png?alt=media&token=8aa401b4-5635-451f-af67-3dcd82117797",width: 70,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary:const Color(0xff5F89D8) ,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            primary: const Color(0xff5F89D8),
                          ),
                          child: Text("Previous",style: Const.btntxt,),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary:const Color(0xff5F89D8) ,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            primary: const Color(0xff5F89D8),
                          ),
                          child: Text("Next",style: Const.btntxt,),
                          onPressed: () async {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => const Website_Created()),
                            // );
                            // if(_formkey.currentState!.validate())
                            // {
                            //
                            // }else{
                            //   print("UnSuccessfull");
                            // }
                          },
                        ),
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
        ],
      ),
    );
  }
}
