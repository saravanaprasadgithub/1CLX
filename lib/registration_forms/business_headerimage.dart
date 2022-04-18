import 'package:flutter/material.dart';
import 'package:one_clx/constants/constant.dart';
import 'package:one_clx/registration_forms/business_images.dart';

class Business_Header extends StatefulWidget {
  const Business_Header({Key? key}) : super(key: key);

  @override
  State<Business_Header> createState() => _Business_HeaderState();
}

class _Business_HeaderState extends State<Business_Header> {
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
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(20,45,20,10),
                  child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FBI.png?alt=media&token=0d982904-2abe-4d03-811c-10364404ef8b",width: 70,)
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,10),
                child: Center(child: Text('Business Images',style: Const.appbartxt,)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,30,20,2),
                child: Align(child: Text("4 of 6 Completed",style: Const.OTPtxt,), alignment: Alignment.center,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,8),
                child: SizedBox(
                  height: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: LinearProgressIndicator(
                      value: 0.8,
                      backgroundColor: Color(0xffF7F8FC),
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4F76CA)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,8),
                child: Center(child: Text('ADD PHOTOS OF YOUR BUSINESS',style: Const.Normalbold,)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,5,20,8),
                child: Center(child: Text("Business photos create your customer's first impression of your company.The best photos send a message to customers about the company's value, create brand loyalty, and sign a more professional appearance.",style: Const.Normal,textAlign: TextAlign.justify)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,5,20,8),
                child: Center(child: Text("Upload header image for your business",style: Const.Normal,textAlign: TextAlign.justify)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,8,20,8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary:const Color(0xff5F89D8) ,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    primary: const Color(0xff5F89D8),
                  ),
                  child: Text("Upload Logo",style: Const.btntxt,),
                  onPressed: () async {

                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Business_Images()),
                        );
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
    );
  }
}