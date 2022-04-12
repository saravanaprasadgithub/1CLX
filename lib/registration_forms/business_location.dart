import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/services.dart';
import 'package:one_clx/constants/constant.dart';

class Business_Location extends StatefulWidget {
  const Business_Location({Key? key}) : super(key: key);

  @override
  State<Business_Location> createState() => _Business_LocationState();
}

class _Business_LocationState extends State<Business_Location> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController MobileCntrlr = TextEditingController();
  TextEditingController PincodeCntrlr = TextEditingController();
  TextEditingController AddressCntrlr = TextEditingController();
  String? countryValue,stateValue,mobile,cityValue,pincode,address;
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
        title: Text('Location & Contact Info',style: Const.appbartxt,),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,10),
                child: Center(child: Text('ADD Business Location',style: Const.Normalbold,)),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,10,20,10),
              child: CSCPicker(
                layout: Layout.vertical,
                dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    border: Border.all(color: Color(0xff5F89D8), width: 1)),
                disabledDropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    border: Border.all(color: Color(0xff5F89D8), width: 1)),
                countryDropdownLabel: "Select Country",
                stateDropdownLabel: "State",
                cityDropdownLabel: "City",
                dropdownHeadingStyle:Const.Normal,
                selectedItemStyle: Const.Normal,
                dropdownItemStyle: Const.Normal,
                onCountryChanged: (value) {
                  setState(() {
                    countryValue = value;
                  });
                },
                onStateChanged:(value) {
                  setState(() {
                    stateValue = value;
                  });
                },
                onCityChanged:(value) {
                  setState(() {
                    cityValue = value;
                  });
                },
              ),
            ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,8,20,8),
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  style: Const.Normal,
                  controller: PincodeCntrlr,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: Icon(Icons.pin_drop_outlined,color: Const.iconclr),
                    hintText: "Pin Code",hintStyle: Const.txt,
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
                      return 'Enter Your Pincode';
                    }
                    return null;
                  },
                  onSaved: (String? value){
                    pincode = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,10),
                child: TextFormField(
                  style: Const.Normal,
                  keyboardType: TextInputType.emailAddress,
                  controller: AddressCntrlr,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: Icon(Icons.business,color: Const.iconclr),
                    hintText: 'Address Line',hintStyle: Const.txt,
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
                      return 'Enter Your Address';
                    }
                    return null;
                  },
                  onSaved: (String? value){
                    address = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,8,20,8),
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  style: Const.Normal,
                  controller: MobileCntrlr,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: Icon(Icons.phone_android_rounded,color: Const.iconclr),
                      hintText: "Mobile Number",hintStyle: Const.txt,
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
                      return 'Enter your Mobile No';
                    }
                    if(value.length<=9||value.length>10){
                      return 'Mobile.No has 10 digits';
                    }
                    return null;
                  },
                  onSaved: (String? value){
                    mobile = value!;
                  },
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const Business_Location()),
                        // );
                        if(_formkey.currentState!.validate())
                        {

                        }else{
                          print("UnSuccessfull");
                        }
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,8,20,0),
                child: Align(child: Text("1 of 6 Completed",style: Const.Normal,), alignment: Alignment.topLeft,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,8),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 15,
                      child: LinearProgressIndicator(
                        value: 0.2,
                        backgroundColor: Color(0xffF0F0F0),
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4F76CA)),
                      ),
                    ),
                    Align(child: Text("20%",style: Const.Normal,), alignment: Alignment.topCenter,),
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
