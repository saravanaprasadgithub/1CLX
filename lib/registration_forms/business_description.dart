import 'package:flutter/material.dart';
import 'package:one_clx/constants/constant.dart';
import 'package:one_clx/registration_forms/publish.dart';

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
        title: Text('Business Description',style: Const.appbartxt,),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,10),
                child: Center(child: Text('ADD BUSINESS DESCRIPTION',style: Const.Normalbold,)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,5,20,10),
                child: Center(child: Text("Provide an overview of the business.This description provides extensive details outlining the business.",style: Const.Normal,textAlign: TextAlign.justify)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,10),
                child: TextFormField(
                  maxLength: null,
                  style: Const.Normal,
                  keyboardType: TextInputType.emailAddress,
                  controller: BusinessDesc,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 40,horizontal: 5),
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
                      borderSide: const BorderSide(color: Color(0xff5F89D8),width: 1),
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
              padding: const EdgeInsets.fromLTRB(20,10,20,10),
              child: TextFormField(
                style: Const.Normal,
                keyboardType: TextInputType.emailAddress,
                controller: EmailCntrlr,
                decoration: InputDecoration(
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
                    borderSide: const BorderSide(color: Color(0xff5F89D8),width: 1),
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
                padding: const EdgeInsets.fromLTRB(20,10,20,10),
                child: TextFormField(
                  style: Const.Normal,
                  keyboardType: TextInputType.emailAddress,
                  controller: WebURLCntrlr,
                  decoration: InputDecoration(
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
                      borderSide: const BorderSide(color: Color(0xff5F89D8),width: 1),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                      child: Text("Previous",style: Const.btntxt,),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
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
                          MaterialPageRoute(builder: (context) => const Publish()),
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,8,20,0),
                child: Align(child: Text("3 of 6 Completed",style: Const.Normal,), alignment: Alignment.topLeft,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,8),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 22,
                      child: LinearProgressIndicator(
                        value: 0.6,
                        backgroundColor: Color(0xffF0F0F0),
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4F76CA)),
                      ),
                    ),
                    Align(child: Text("60%",style: Const.common,), alignment: Alignment.topCenter,),
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
