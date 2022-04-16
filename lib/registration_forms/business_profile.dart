import 'package:flutter/material.dart';
import 'package:one_clx/constants/constant.dart';
import 'package:one_clx/registration_forms/business_location.dart';

class Business_Profile extends StatefulWidget {
  const Business_Profile({Key? key}) : super(key: key);

  @override
  State<Business_Profile> createState() => _Business_ProfileState();
}

class _Business_ProfileState extends State<Business_Profile> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController BusinessName = TextEditingController();
  String? businame,businesstype;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //         gradient: LinearGradient(
      //             begin: Alignment.topLeft,
      //             end: Alignment.bottomRight,
      //             colors: [Color(0xff385CB7), Color(0xff5F89D8),])),
      //   ),
      //   elevation: 0.0,
      //   centerTitle: true,
      //   title: Text('Business Profile',style: Const.appbartxt,),
      // ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
                SizedBox(
                  height: MediaQuery.of(context).size.height/20,
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(20,0,20,0),
                    child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FBP.png?alt=media&token=691c22f3-68af-4df3-a66c-97d23e551355",width: 70,)
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/35,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Center(child: Text('Business Profile',style: Const.appbartxt,)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/18,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Align(child: Text("0 of 6 Completed",style: Const.OTPtxt,), alignment: Alignment.center,),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: SizedBox(
                    height: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: LinearProgressIndicator(
                        value: 0.1,
                        backgroundColor: Color(0xffF0F0F0),
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4F76CA)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/55,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Center(child: Text('CREATE BUSINESS PROFILE',style: Const.Normalbold,)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/45,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Center(child: Text('Start Buliding Your Business Profile',style: Const.Normal)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/45,
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
                        borderSide: const BorderSide(color: Color(0xff5F89D8),width: 1),
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
                  height: MediaQuery.of(context).size.height/45,
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
                        borderSide: const BorderSide(color: Color(0xff5F89D8),width: 1),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(20,8,20,8),
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       onPrimary:const Color(0xff5F89D8) ,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5.0),
                //       ),
                //       primary: const Color(0xff5F89D8),
                //     ),
                //     child: Text("Next",style: Const.btntxt,),
                //     onPressed: () async {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => const Business_Location()),
                //       );
                //       // if(_formkey.currentState!.validate())
                //       // {
                //       //
                //       // }else{
                //       //   print("UnSuccessfull");
                //       // }
                //     },
                //   ),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/12,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
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
                        child: Text("Next",style: Const.btntxt,),
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Business_Location()),
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
                        padding: const EdgeInsets.only(top:30.0),
                        child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fimg2.png?alt=media&token=b8fcb386-3ab4-4f9c-bece-bc3be039c5e5",width: 70,),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(20,8,20,0),
                //   child: Align(child: Text("0 of 6 Completed",style: Const.Normal,), alignment: Alignment.topLeft,),
                // ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(20,0,20,8),
                //   child: Stack(
                //     children: [
                //       SizedBox(
                //         height: 15,
                //         child: LinearProgressIndicator(
                //           value: 0.1,
                //           backgroundColor: Color(0xffF0F0F0),
                //           valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4F76CA)),
                //         ),
                //       ),
                //       Align(child: Text("0%",style: Const.Normal,), alignment: Alignment.topCenter,),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
