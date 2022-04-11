import 'dart:async';
import 'package:flutter/material.dart';
import 'package:one_clx/authentication/login.dart';
import 'package:one_clx/constants/constant.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => login()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/bluelogo.png',width: 250,),
          ),
          SizedBox(height: 35,),
          Image.asset('assets/splash.png',fit: BoxFit.fill,),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,15,20,0),
            child: Text('CREATE YOUR BUSINESS WEBSITE IN 3-MINUTES',style: Const.bigtxt,textAlign:TextAlign.center,),
          ),
          SizedBox(height: 80,),
          CircularProgressIndicator(
          color: Color(0xff385CB7),
          ),
        ],),
    );
  }
}
