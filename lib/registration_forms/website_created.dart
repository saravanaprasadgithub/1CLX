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
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff385CB7), Color(0xff5F89D8),])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              height: 400,
              child: Card(
                child:Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fcomplete.png?alt=media&token=6d442c4f-7d07-43a3-8c3d-b38c13caa464",width: 500,)
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,8,20,10),
                      child: Center(child: Text('CONGRATS!!! YOU COMPLETED THE PROCESS',style: Const.Normalbold,textAlign: TextAlign.center,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,5,20,10),
                      child: Center(child: Text("Your Business Website URL: https://www.1clx.com/businessname",style: Const.Normal,textAlign: TextAlign.center,)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,20,20,0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onPrimary:const Color(0xff5F89D8) ,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
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
                          padding: const EdgeInsets.fromLTRB(20,20,20,0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onPrimary:const Color(0xff5F89D8) ,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
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
                      ],
                    ),
                  ],
                ),

              ),
            ),
          ),
        ),
      ),
    );
  }
}
