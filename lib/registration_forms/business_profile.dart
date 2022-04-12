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
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff385CB7), Color(0xff5F89D8),])),
        ),
        elevation: 0.0,
        centerTitle: true,
        title: Text('Business Profile',style: Const.appbartxt,),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,10),
                child: Center(child: Text('CREATE BUSINESS PROFILE',style: Const.Normalbold,)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,5,20,10),
                child: Center(child: Text('Start Buliding Your Business Profile',style: Const.Normal,)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,10),
                child: TextFormField(
                  style: Const.Normal,
                  keyboardType: TextInputType.emailAddress,
                  controller: BusinessName,
                  decoration: InputDecoration(
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,10),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20,8,20,8),
                child: ElevatedButton(
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,8,20,0),
                child: Align(child: Text("0 of 6 Completed",style: Const.Normal,), alignment: Alignment.topLeft,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,8),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 15,
                      child: LinearProgressIndicator(
                        value: 0.1,
                        backgroundColor: Color(0xffF0F0F0),
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4F76CA)),
                      ),
                    ),
                    Align(child: Text("0%",style: Const.Normal,), alignment: Alignment.topCenter,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
